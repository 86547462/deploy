## K8s安装使用教程

##### kubeadm安装方式

```ruby
#关闭防火墙
systemctl stop firewalld
systemctl disable firewalld

#关闭selinux
sed -i 's/enforcing/disabled/' /etc/selinux/config #永久

#关闭swap
sed -ri 's/.*swap.*/#&/' /etc/fstab #永久
#关闭后需要重启虚拟机

#根据规格设置主机名称
hostnamectl set-hostname "主机名"

#master主机添加hosts
cat >> /etc/hosts << EOF
192.168.11.200 master
192.168.11.201 node1
192.168.11.202 node2
EOF

#配置iptables参数，使得流经网桥的流量也经过iptables/netfilter防火墙
cat >> /etc/sysctl.d/k8s.conf << EOF
vm.swappiness=0
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

#配置生效
modprobe br_netfilter
modprobe overlay
sysctl -p /etc/sysctl.d/k8s.conf
sysctl --system




#所有主机，安装docker，删除原有包
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

#获取docker-repo
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#安装docker
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#启动docker，并且设置开机自动启动
systemctl enable docker
systemctl start docker

#配置加速器文件
配置加速器文件
cat >> /etc/docker/daemon.json <<-EOF
{
  "registry-mirrors": [
    "http://74f21445.m.daocloud.io",
    "https://registry.docker-cn.com",
    "http://hub-mirror.c.163.com",
    "https://docker.mirrors.ustc.edu.cn"
  ], 
  "insecure-registries": ["kubernetes-register.sswang.com"], 
  "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

#重启docker服务
systemctl daemon-reload
systemctl restart docker

#下载cri-docker
下载软件
mkdir -p /data/softs && cd /data/softs
yum -y install wget
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.11/cri-dockerd-0.3.11.arm64.tgz

解压软件
tar -xvf cri-dockerd-0.3.11.amd64.tar
mv cri-dockerd/cri-dockerd /usr/local/bin/

检查效果
cri-dockerd --version

#定制自启动文件
定制配置文件
cat > /etc/systemd/system/cri-dockerd.service<<-EOF
[Unit]
Description=CRI Interface for Docker Application Container Engine
Documentation=https://docs.mirantis.com
After=network-online.target firewalld.service docker.service
Wants=network-online.target
[Service]
Type=notify
ExecStart=/usr/local/bin/cri-dockerd --pod-infra-container-image=registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.9
 --network-plugin=cni --cni-conf-dir=/etc/cni/net.d --cni-bin-dir=/opt/cni/bin --container-runtime-endpoint=unix:///var/run/cri-dockerd.sock --cri-dockerd-root-directory=/var/lib/dockershim --docker-endpoint=unix:///var/run/docker.sock --cri-dockerd-root-directory=/var/lib/docker
ExecReload=/bin/kill -s HUP $MAINPID
TimeoutSec=0
RestartSec=2
Restart=always
StartLimitBurst=3
StartLimitInterval=60s
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
TasksMax=infinity
Delegate=yes
KillMode=process
[Install]
WantedBy=multi-user.target
EOF

#定制配置
cat > /etc/systemd/system/cri-dockerd.socket <<-EOF
[Unit]
Description=CRI Docker Socket for the API
PartOf=cri-docker.service

[Socket]
ListenStream=/var/run/cri-dockerd.sock
SocketMode=0660
SocketUser=root
SocketGroup=docker

[Install]
WantedBy=sockets.target
EOF

#设置服务开机自启动
systemctl daemon-reload
systemctl enable cri-dockerd.service
systemctl restart cri-dockerd.service


#k8s集群初始化
#定制阿里云的关于kubernetes的软件源
cat > /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

#master环境软件部署
yum install kubeadm kubectl kubelet -y

#node环境软件部署
yum install kubeadm kubectl kubelet -y

#设置kubelet开机自动启动
systemctl start kubelet.service
systemctl enable kubelet.service

#检查镜像文件列表
kubeadm config images list

#获取镜像文件
images=$(kubeadm config images list --kubernetes-version=1.28.2 | awk -F "/" '{print $NF}')
for i in ${images}
do
  docker pull registry.aliyuncs.com/google_containers/$i
  docker tag registry.aliyuncs.com/google_containers/$i      registry.aliyuncs.com/google_containers/$i
done
  
  

  
#master节点初始化
环境初始化命令
kubeadm init --kubernetes-version=1.28.2 \
--apiserver-advertise-address=192.168.11.200 \
--image-repository registry.aliyuncs.com/google_containers \
--service-cidr=10.96.0.0/12 \
--pod-network-cidr=10.244.0.0/16 \
--ignore-preflight-errors=Swap \
--cri-socket=unix:///var/run/cri-dockerd.sock

#复制join命令，加入到master集群
kubeadm join 192.168.11.200:6443 --token 4gyu65.w9e4q0f9xjf3mdij \
        --discovery-token-ca-cert-hash sha256:0b2e992eb3a28dce4982e561c1ff63f17622cb2f71bc23c7cceb9f014067a482 --cri-socket=unix:///var/run/cri-dockerd.sock

#部署网络插件calico,下载calico.yaml文件
# 修改 calico.yaml 文件中的 CALICO_IPV4POOL_CIDR 配置，修改为与初始化的 cidr 相同
#删除所有docker.io/
  
#创建阿里云secret
kubectl create -n hcwl secret docker-registry aliyun-registry-secret     --docker-server=registry.cn-shenzhen.aliyuncs.com     --docker-username=广东宏扬教育科技有限公司     --docker-password=hongyang@2007     --docker-email=hongyangtd@163.com
  
  
#安装nfs插件,每个节点
sudo yum install nfs-utils -y
#主节点创建共享文件夹
mkdir -p /root/data/nacos
chmod 777 /root/data/nacos
#设置共享节点
vi /etc/exports
#填写数据
/root/data/nacos 172.16.243.0/24(rw,sync,no_root_squash)
systemctl restart nfs-server.service
showmount -e
#主节点设置
    
  
```

![image-20240702165632944](D:\project\项目部署\jpg\image-20240702165632944.png)