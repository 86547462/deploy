# kubesphere3.0的安装文档

**<font style="color:#DF2A3F;">本文档已经过时：参照 《云原生实战》最新教程</font>**

**<font style="color:#DF2A3F;">新视频地址：</font>**[**<font style="color:#DF2A3F;">https://www.bilibili.com/video/BV13Q4y1C7hS</font>**](https://www.bilibili.com/video/BV13Q4y1C7hS)

**<font style="color:#DF2A3F;">第 68集开始完整讲解KubeSphere使用与安装流程</font>**



基于kubernetes环境安装kubesphere3.0的安装文档

本文档主要是在centos7系统下基于kubernetes环境安装kubesphere3.0的安装文档。

# 1   环境准备
## 1.1 系统要求
本地虚拟机三台

要求：centos7.6~7.8；以下为

[https://kuboard.cn/install/install-k8s.html#%E6%A3%80%E6%9F%A5-centos-hostname](https://kuboard.cn/install/install-k8s.html#%25E6%25A3%2580%25E6%259F%25A5-centos-hostname) 网站的检验结果。

| CentOS 版本 | 本文档是否兼容 | 备注 |
| --- | --- | --- |
| 7.8 | 是 | 已经验证 |
| 7.7 | 是 | 已经验证 |
| 7.6 | 是 | 已经验证 |
| 7.5 | 否 | 已证实会出现 kubelet 无法启动的问题 |
| 7.4 | 否 | 已证实会出现 kubelet 无法启动的问题 |
| 7.3 | 否 | 已证实会出现 kubelet 无法启动的问题 |
| 7.2 | 否 | 已证实会出现 kubelet 无法启动的问题 |


## 1.2 <font style="color:white;">虚拟机安装步骤</font>
安装虚拟机比较的简单，这里不做介绍。

### 1.2.1 创建客户机的向导
#### 1.2.1.1   创建新的虚拟机
![1605144967621-e827a0cb-76aa-4048-9a09-b93efa33c97f.png](./img/4797OHnNvQQn9KN2/1605144967621-e827a0cb-76aa-4048-9a09-b93efa33c97f-650470.png)

<font style="color:black;">点击创建新的虚拟机。</font>

#### 1.2.1.2   新建虚拟机向导
![1605144967764-faa44df9-932d-45c4-9f02-75bdb49eb6e0.png](./img/4797OHnNvQQn9KN2/1605144967764-faa44df9-932d-45c4-9f02-75bdb49eb6e0-141991.png)

<font style="color:black;">选择典型，点击下一步。</font>

#### 1.2.1.3   安装客户机的操作系统
![1605144967880-c65194ee-7c65-4c10-b29d-dea0212cb3c7.png](./img/4797OHnNvQQn9KN2/1605144967880-c65194ee-7c65-4c10-b29d-dea0212cb3c7-824967.png)

<font style="color:black;">选择稍后安装操作系统，点击下一步。</font>

#### 1.2.1.4   选择客户机的操作系统类型
![1605144968013-449283f5-fbea-41ef-b3ab-de7f1acc7e15.png](./img/4797OHnNvQQn9KN2/1605144968013-449283f5-fbea-41ef-b3ab-de7f1acc7e15-024068.png)

<font style="color:black;">我们这里安装的</font><font style="color:black;">Linux Centos7</font><font style="color:black;">版本。这里我们选择的</font><font style="color:black;">Linux</font><font style="color:black;">系统。版本选择</font><font style="color:black;">Redhat Enterpise Linux7 64</font><font style="color:black;">位。</font>

#### 1.2.1.5   命名客户机和存储位置
![1605144968205-1d320adc-4452-498a-b1d1-437388a999aa.png](./img/4797OHnNvQQn9KN2/1605144968205-1d320adc-4452-498a-b1d1-437388a999aa-151101.png)

<font style="color:black;">这里根据自己的情况设置客户机的名称以及客户存储的本地的位置。</font>

#### 1.2.1.6   配置客户机的磁盘的大小
![1605144968315-313d13fa-ec7f-4bd3-83ad-74deae17ee96.png](./img/4797OHnNvQQn9KN2/1605144968315-313d13fa-ec7f-4bd3-83ad-74deae17ee96-811963.png)

<font style="color:black;">默认给出的</font><font style="color:black;">20G</font><font style="color:black;">，这里我设置的大一写。设置成</font><font style="color:black;">100G</font><font style="color:black;">。点击下一步。</font>

#### 1.2.1.7   已经准备创建好的客户机
![1605144968439-97c7aa90-e3ec-4e92-9736-43f84b3cab3a.png](./img/4797OHnNvQQn9KN2/1605144968439-97c7aa90-e3ec-4e92-9736-43f84b3cab3a-577110.png)

<font style="color:black;">点击完成。基本的客户机的创建向导完成。</font>

#### 1.2.1.8   配置客户机的属性
##### 1.2.1.8.1     内存配置大小
![1605144968541-c2536607-89df-462a-b631-cf7b8fdd3873.png](./img/4797OHnNvQQn9KN2/1605144968541-c2536607-89df-462a-b631-cf7b8fdd3873-103093.png)

<font style="color:black;">这里我们一般设置成企业：</font><font style="color:black;">8G</font><font style="color:black;">、个人使用</font><font style="color:black;">2G</font><font style="color:black;">做演示。</font>

##### 1.2.1.8.2     处理器配置
![1605144968650-04e3b1d8-df24-435b-b511-f72e374f7608.png](./img/4797OHnNvQQn9KN2/1605144968650-04e3b1d8-df24-435b-b511-f72e374f7608-963640.png)

<font style="color:black;">处理器配置，我们一般配置成</font><font style="color:black;">2</font><font style="color:black;">个处理器。</font>

##### 1.2.1.8.3     硬盘配置
![1605144968754-9af8994a-d295-4a9c-931d-b4bcc0ccd72d.png](./img/4797OHnNvQQn9KN2/1605144968754-9af8994a-d295-4a9c-931d-b4bcc0ccd72d-558408.png)

<font style="color:black;">这里默认选择。不需要操作。</font>

##### 1.2.1.8.4     CD/DVD配置
![1605144968838-22669f2b-450e-413a-88e3-cb05342a0da2.png](./img/4797OHnNvQQn9KN2/1605144968838-22669f2b-450e-413a-88e3-cb05342a0da2-742970.png)

<font style="color:black;">设备状态设置成启动时连接，选择</font><font style="color:black;">ISO</font><font style="color:black;">镜像文件连接并配置好连接。</font>

##### 1.2.1.8.5     网络适配器配置
![1605144968952-d44c8334-6f72-4e46-9c03-97e9350e036e.png](./img/4797OHnNvQQn9KN2/1605144968952-d44c8334-6f72-4e46-9c03-97e9350e036e-949425.png)

<font style="color:black;">在本地配置下我们使用的</font><font style="color:black;">NAT</font><font style="color:black;">模式。如果在企业搭建上，建议使用桥接模式。</font>

##### 1.2.1.8.6     USB控制器配置
![1605144969133-507dce56-16c0-4071-ad99-fa4471e31ed3.png](./img/4797OHnNvQQn9KN2/1605144969133-507dce56-16c0-4071-ad99-fa4471e31ed3-314077.png)

<font style="color:black;">对服务器来说，不需要该设备。移除即可。</font>

##### 1.2.1.8.7     声卡配置
![1605144969224-5629200f-c49b-4cf5-9ff8-40597a9d3d16.png](./img/4797OHnNvQQn9KN2/1605144969224-5629200f-c49b-4cf5-9ff8-40597a9d3d16-611576.png)

<font style="color:black;">对服务器来说，不需要该设备。移除即可。</font>

##### 1.2.1.8.8     打印机配置
![1605144969369-59334fa4-bec8-41e2-bcc5-69416b64b15d.png](./img/4797OHnNvQQn9KN2/1605144969369-59334fa4-bec8-41e2-bcc5-69416b64b15d-254110.png)

<font style="color:black;">对服务器来说，不需要该设备。移除即可。</font>

##### 1.2.1.8.9     显示器配置
![1605144969571-af46dc2b-aab7-4fea-a937-013556a174ed.png](./img/4797OHnNvQQn9KN2/1605144969571-af46dc2b-aab7-4fea-a937-013556a174ed-568095.png)

<font style="color:black;">不需要操作，使用默认即可。</font>

<font style="color:black;">这里客户机的基本的配置基本完成。</font>

#### 1.2.1.9   安装客户机的步骤
##### 1.2.1.9.1     开始安装客户机系统
![1605144969739-f487975b-e957-481d-8c3f-034214b39bdb.png](./img/4797OHnNvQQn9KN2/1605144969739-f487975b-e957-481d-8c3f-034214b39bdb-713704.png)

##### 1.2.1.9.2     按下回车开始安装配置虚拟机安装属性
![1605144969909-4115b2fa-4068-4400-9004-33d43334c722.png](./img/4797OHnNvQQn9KN2/1605144969909-4115b2fa-4068-4400-9004-33d43334c722-833980.png)

<font style="color:black;">等待加载系统镜像完毕。</font>

##### 1.2.1.9.3     选择客户机的系统语言
![1605144970108-64b35210-cfc3-408b-b861-eb4014c20576.png](./img/4797OHnNvQQn9KN2/1605144970108-64b35210-cfc3-408b-b861-eb4014c20576-564660.png)

<font style="color:black;">这里我们选择中文简体。点击继续。</font>

##### 1.2.1.9.4     设置安装客户机的基本配置
###### 1.2.1.9.4.1    安装选择类型
![1605144970257-a4c873ae-229b-469c-97d3-33efb07aeb99.png](./img/4797OHnNvQQn9KN2/1605144970257-a4c873ae-229b-469c-97d3-33efb07aeb99-251252.png)

![1605144970414-439687b6-ef76-4f25-b945-c3389eff2f12.png](./img/4797OHnNvQQn9KN2/1605144970414-439687b6-ef76-4f25-b945-c3389eff2f12-882295.png)

<font style="color:black;">点击完成。</font>

##### 1.2.1.9.5     开始安装客户机系统
![1605144970540-056e3c4e-b679-4181-97ae-4420bde97ec0.png](./img/4797OHnNvQQn9KN2/1605144970540-056e3c4e-b679-4181-97ae-4420bde97ec0-205496.png)

<font style="color:black;">点击开始安装。</font>

##### 1.2.1.9.6     用户设置
![1605144970667-aa00cb49-a736-4805-95a7-479f3eb0185f.png](./img/4797OHnNvQQn9KN2/1605144970667-aa00cb49-a736-4805-95a7-479f3eb0185f-891441.png)

<font style="color:black;">创建密码。自己记住即可。这里是管理员登录密码。</font>

##### 1.2.1.9.7     安装系统进行中
![1605144970816-80109862-39ea-4338-ba00-6e6ecbcdf431.png](./img/4797OHnNvQQn9KN2/1605144970816-80109862-39ea-4338-ba00-6e6ecbcdf431-599385.png)

<font style="color:black;">此处需要等待一段时间，不同的机器配置等待的时间不一致。</font>

##### 1.2.1.9.8     初始化客户机的步骤
<font style="color:black;">安装成功之后，我们看到以下的图。</font>

![1605144970973-95decd0f-1508-4af2-8e57-64733aab6ae5.png](./img/4797OHnNvQQn9KN2/1605144970973-95decd0f-1508-4af2-8e57-64733aab6ae5-078661.png)

<font style="color:black;">点击重启即可。</font>

##### 1.2.1.9.9     接受许可证
![1605144971085-fc5b2862-109f-4bd8-864d-f7e10ce16f16.png](./img/4797OHnNvQQn9KN2/1605144971085-fc5b2862-109f-4bd8-864d-f7e10ce16f16-503277.png)

<font style="color:black;">勾选我同意许可协议。重启系统。输入用户名密码登录到系统。至此我们的系统客户机安装成</font><font style="color:black;">功。</font>

##### 1.2.1.9.10   系统欢迎页面
![1605144971207-0d23b73d-f037-4e14-a42e-98f1088ed84f.png](./img/4797OHnNvQQn9KN2/1605144971207-0d23b73d-f037-4e14-a42e-98f1088ed84f-329911.png)

<font style="color:black;">选择汉语，点击前进。</font>

##### 1.2.1.9.11   自定义键盘输入法
![1605144971329-b5e4b90c-1cc1-4912-a226-27d3ebbc587b.png](./img/4797OHnNvQQn9KN2/1605144971329-b5e4b90c-1cc1-4912-a226-27d3ebbc587b-311895.png)

<font style="color:black;">选择汉语，点击前进。</font>

##### 1.2.1.9.12   隐私设置
![1605144971461-b2be6992-9f24-4ad0-8f81-729e0cc8b784.png](./img/4797OHnNvQQn9KN2/1605144971461-b2be6992-9f24-4ad0-8f81-729e0cc8b784-193012.png)

<font style="color:black;">点击前进。</font>

##### 1.2.1.9.13   在线登录账号
![1605144971579-b290e45b-19b3-4a29-b0fe-a1584d0b6d2a.png](./img/4797OHnNvQQn9KN2/1605144971579-b290e45b-19b3-4a29-b0fe-a1584d0b6d2a-742099.png)

<font style="color:black;">这里我们跳过即可。</font>

##### 1.2.1.9.14   开始使用系统
![1605144971706-593ef02d-767e-483b-bb76-1509599aead4.png](./img/4797OHnNvQQn9KN2/1605144971706-593ef02d-767e-483b-bb76-1509599aead4-197744.png)

##### 1.2.1.9.15   打开终端输入命令行查询IP地址
![1605144971804-9f72f14b-15d0-465b-8aa9-309a953ebe85.png](./img/4797OHnNvQQn9KN2/1605144971804-9f72f14b-15d0-465b-8aa9-309a953ebe85-848407.png)

![1605144971890-bc2c672a-5b8b-4371-96aa-eaf0cb0f31e5.png](./img/4797OHnNvQQn9KN2/1605144971890-bc2c672a-5b8b-4371-96aa-eaf0cb0f31e5-788598.png)

<font style="color:black;">我们连接的</font><font style="color:black;">ens33</font><font style="color:black;">的网卡，因此我们得到的本地的</font><font style="color:black;">IP</font><font style="color:black;">地址为：</font><font style="color:black;">192.168.196.128</font><font style="color:black;">，这里每个人的</font><font style="color:black;">IP</font><font style="color:black;">地址不一样。根据自己的实际情况获取</font><font style="color:black;">IP</font><font style="color:black;">地址。</font>

###### 1.2.1.9.15.1   注意，如果没有ip显示：
<font style="color:black;">你可以在</font><font style="color:red;">/etc/sysconfig/network-scripts </font><font style="color:black;"> </font><font style="color:black;">这个目录下面的</font><font style="color:red;">ifcfg-ens33</font><font style="color:black;">这个文件里面的</font>**<font style="color:black;">O</font>****NBOOT=no****，修改成****ONBOOT=yes****，然后通过命于重新启动网络服务。**

![1605144971985-587080ad-92ae-4162-86f8-cccbb367676e.png](./img/4797OHnNvQQn9KN2/1605144971985-587080ad-92ae-4162-86f8-cccbb367676e-686260.png)

**重新启动网络服务：**

<font style="color:red;">/etc/init.d/network restart </font><font style="color:red;">或 service network restart</font>

![1605144972085-9bc72bf0-c6ac-42ce-844f-70d0ee9e9fe7.png](./img/4797OHnNvQQn9KN2/1605144972085-9bc72bf0-c6ac-42ce-844f-70d0ee9e9fe7-152861.png)

<font style="color:black;">然后可设置静态网络</font><font style="color:black;">ip</font><font style="color:black;">：</font>

<font style="color:black;">设置静态</font><font style="color:black;">ip</font><font style="color:black;">的话，一定要记住，设置</font>GATEWAY网关的时候要跟虚拟网络编辑器的网关要一致，否则无法上网！！！

![1605144972195-c12c75f2-1ad0-443f-8313-6ba36ff23749.png](./img/4797OHnNvQQn9KN2/1605144972195-c12c75f2-1ad0-443f-8313-6ba36ff23749-696050.png)

<font style="color:black;"> </font>

**设置完静态****IP****以后重新启动网络服务：**

<font style="color:red;">/etc/init.d/network restart </font><font style="color:red;">或 service network restart</font>

<font style="color:red;"> </font>

<font style="color:black;">然后测试能不能上网</font><font style="color:black;">:</font>

<font style="color:red;">ping www.baidu.com</font>

![1605144972314-ec6e364a-01b8-4524-a648-737fb8ac438e.png](./img/4797OHnNvQQn9KN2/1605144972314-ec6e364a-01b8-4524-a648-737fb8ac438e-158380.png)

##### 1.2.1.9.16   使用外部客户端工具连接
![1605144972449-858e243d-99ca-4fb9-87f7-ff391556a8ed.png](./img/4797OHnNvQQn9KN2/1605144972449-858e243d-99ca-4fb9-87f7-ff391556a8ed-898168.png)

这里虚拟机安装centos7系统完成。

安装安装上述的安装方式，需要安装三台虚拟机。

## 1.3 虚拟机环境如下
| IP地址 | 说明 | 说明 |
| --- | --- | --- |
| 192.168.142.144 | master节点 | 8G内存 4核CPU |
| 192.168.142.145 | node1节点 | 8G内存 4核CPU |
| 192.168.142.146 | node2节点 | 8G内存 4核CPU |


## 1.4 <font style="color:white;">前置步骤说明</font>
1)   centos 版本为 7.6 或 7.7、CPU 内核数量大于等于 2，且内存大于等于 4G。

2)   hostname 不是 localhost，且不包含下划线、小数点、大写字母。

3)   任意节点都有固定的内网 IP 地址(集群机器统一内网)。

4)   任意节点上 IP 地址 可互通（无需 NAT 映射即可相互访问），且没有防火墙、安全组隔离。

5)   任意节点不会直接使用 docker run 或 docker-compose 运行容器，Pod。

### 1.4.1 安装基础工具
| yum install -y wget && yum install -y vim && yum install -y lsof && yum install -y net-tools |
| --- |


![1605144972563-704edb8d-cf61-402b-b486-a41529eed7b8.png](./img/4797OHnNvQQn9KN2/1605144972563-704edb8d-cf61-402b-b486-a41529eed7b8-953517.png)

### 1.4.2 配置hosts的地址名称
| vim /etc/hosts<br/> <br/>192.168.142.147 k8s-node1<br/>192.168.142.148 k8s-node2<br/>192.168.142.149 k8s-node3<br/><font style="color:rgb(51, 51, 51);">hostnamectl set-hostname <newhostname></font><font style="color:rgb(51, 51, 51);">：指定新的</font><font style="color:rgb(51, 51, 51);">hostname su </font><font style="color:rgb(51, 51, 51);">切换过来</font><br/>  |
| --- |


 

### 1.4.3 关闭防火墙或者阿里云开通安全组端口访问
| systemctl stop firewalld<br/>systemctl disable firewalld<br/> <br/><font style="color:rgb(77, 77, 77);">执行关闭命令： systemctl stop firewalld.service</font><br/><font style="color:rgb(77, 77, 77);">再次执行查看防火墙命令：</font><font style="color:rgb(77, 77, 77);">systemctl status firewalld.service</font><br/><font style="color:rgb(77, 77, 77);">执行开机禁用防火墙自启命令  ： </font><font style="color:rgb(77, 77, 77);">systemctl disable firewalld.service</font><br/>  |
| --- |


![1605144972671-b09f107a-51d6-4aa3-b128-3cc43c8471a8.png](./img/4797OHnNvQQn9KN2/1605144972671-b09f107a-51d6-4aa3-b128-3cc43c8471a8-754544.png)

![1605144972791-7fce74c4-1617-4756-9ed9-42617e9c948c.png](./img/4797OHnNvQQn9KN2/1605144972791-7fce74c4-1617-4756-9ed9-42617e9c948c-725469.png)![1605144972880-94c2a719-0fa7-4bd9-8e02-00567d9072e4.png](./img/4797OHnNvQQn9KN2/1605144972880-94c2a719-0fa7-4bd9-8e02-00567d9072e4-531729.png)

### 1.4.4 <font style="color:black;">关闭 selinux</font>
| sed -i 's/enforcing/disabled/' /etc/selinux/config<br/>setenforce 0<br/>cat /etc/selinux/config |
| --- |


![1605144972983-dc18123c-56c1-4508-9acb-15f344c180b1.png](./img/4797OHnNvQQn9KN2/1605144972983-dc18123c-56c1-4508-9acb-15f344c180b1-541374.png)

![1605144973093-5bae02c4-989e-4f70-8629-4968be8d59e2.png](./img/4797OHnNvQQn9KN2/1605144973093-5bae02c4-989e-4f70-8629-4968be8d59e2-759042.png)

![1605144973208-67eb3410-6598-4543-a6b0-0d67e41f771e.png](./img/4797OHnNvQQn9KN2/1605144973208-67eb3410-6598-4543-a6b0-0d67e41f771e-967254.png)

### 1.4.5 关闭 swap
| swapoff -a  #临时<br/>sed -ri 's/.*swap.*/#&/' /etc/fstab  #永久<br/>free -l -h |
| --- |


![1605144973364-70d22479-3bf5-47cf-bafb-06d090b5ecc3.png](./img/4797OHnNvQQn9KN2/1605144973364-70d22479-3bf5-47cf-bafb-06d090b5ecc3-983722.png)

![1605144973474-8099eb0b-fdc1-46d1-af5c-2349839c2341.png](./img/4797OHnNvQQn9KN2/1605144973474-8099eb0b-fdc1-46d1-af5c-2349839c2341-244212.png) ![1605144973568-77954181-0d1b-428c-8d2d-97e708896c8b.png](./img/4797OHnNvQQn9KN2/1605144973568-77954181-0d1b-428c-8d2d-97e708896c8b-070748.png)

### 1.4.6 将桥接的 IPv4 流量传递到 iptables 的链
#### 1.4.6.1   如果没有/etc/sysctl.conf文件的话直接执行
| echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf<br/>echo "net.bridge.bridge-nf-call-ip6tables = 1" >> /etc/sysctl.conf<br/>echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.conf<br/>echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf<br/>echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf<br/>echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf<br/>echo "net.ipv6.conf.all.forwarding = 1"  >> /etc/sysctl.conf |
| --- |


![1605144973672-eec716fd-095e-46a2-8742-d9d282936cec.png](./img/4797OHnNvQQn9KN2/1605144973672-eec716fd-095e-46a2-8742-d9d282936cec-982618.png)

![1605144973771-832975cb-1962-40b2-8862-f771bb0b05cd.png](./img/4797OHnNvQQn9KN2/1605144973771-832975cb-1962-40b2-8862-f771bb0b05cd-465779.png)

#### 1.4.6.2   如果有该文件可以执行以下命令
| sed -i "s#^net.ipv4.ip_forward.*#net.ipv4.ip_forward=1#g"  /etc/sysctl.conf<br/>sed -i "s#^net.bridge.bridge-nf-call-ip6tables.*#net.bridge.bridge-nf-call-ip6tables=1#g"  /etc/sysctl.conf<br/>sed -i "s#^net.bridge.bridge-nf-call-iptables.*#net.bridge.bridge-nf-call-iptables=1#g"  /etc/sysctl.conf<br/>sed -i "s#^net.ipv6.conf.all.disable_ipv6.*#net.ipv6.conf.all.disable_ipv6=1#g"  /etc/sysctl.conf<br/>sed -i "s#^net.ipv6.conf.default.disable_ipv6.*#net.ipv6.conf.default.disable_ipv6=1#g"  /etc/sysctl.conf<br/>sed -i "s#^net.ipv6.conf.lo.disable_ipv6.*#net.ipv6.conf.lo.disable_ipv6=1#g"  /etc/sysctl.conf<br/>sed -i "s#^net.ipv6.conf.all.forwarding.*#net.ipv6.conf.all.forwarding=1#g"  /etc/sysctl.conf |
| --- |


![1605144973880-3c9300f8-ca38-4a54-84f7-cec3a76e3799.png](./img/4797OHnNvQQn9KN2/1605144973880-3c9300f8-ca38-4a54-84f7-cec3a76e3799-429767.png)

![1605144974008-c4dc232d-37f6-4a74-808d-6d96b73a54ee.png](./img/4797OHnNvQQn9KN2/1605144974008-c4dc232d-37f6-4a74-808d-6d96b73a54ee-560760.png)

#### 1.4.6.3   执行命令以应用
| sysctl -p |
| --- |


![1605144974123-c665cc28-5ba3-454c-9cdf-8ecc58cbcf69.png](./img/4797OHnNvQQn9KN2/1605144974123-c665cc28-5ba3-454c-9cdf-8ecc58cbcf69-421604.png)

![1605144974206-1f01db67-6970-472f-b381-a9a7ca9fb99c.png](./img/4797OHnNvQQn9KN2/1605144974206-1f01db67-6970-472f-b381-a9a7ca9fb99c-066877.png)

### 1.4.7 安装Docker环境（所有节点）
#### 1.4.7.1   卸载旧版本的docker
| sudo yum remove docker \<br/>  docker-client \<br/>  docker-client-latest \<br/>  docker-common \<br/>  docker-latest \<br/>  docker-latest-logrotate \<br/>  docker-logrotate \<br/>  docker-engine |
| --- |


![1605144974322-8bc86d4f-4721-43be-957f-22e85695911d.png](./img/4797OHnNvQQn9KN2/1605144974322-8bc86d4f-4721-43be-957f-22e85695911d-248153.png)

![1605144974526-d6a34da6-3b01-4eb5-9858-a60d130bb012.png](./img/4797OHnNvQQn9KN2/1605144974526-d6a34da6-3b01-4eb5-9858-a60d130bb012-478649.png)

#### 1.4.7.2   安装基础依赖
| yum install -y yum-utils \<br/>device-mapper-persistent-data \<br/>lvm2 |
| --- |


![1605144974744-0ddb664e-14b1-4e55-8918-9c5f92495143.png](./img/4797OHnNvQQn9KN2/1605144974744-0ddb664e-14b1-4e55-8918-9c5f92495143-181552.png)

![1605144974900-909eaa73-e958-4d39-bc36-78ea96b1dd9a.png](./img/4797OHnNvQQn9KN2/1605144974900-909eaa73-e958-4d39-bc36-78ea96b1dd9a-500304.png)

#### 1.4.7.3   配置docker yum源
| sudo yum-config-manager \<br/>--add-repo \<br/>[http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo](http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo) |
| --- |


![1605144975021-8821c871-c8c1-442f-8e97-801876932973.png](./img/4797OHnNvQQn9KN2/1605144975021-8821c871-c8c1-442f-8e97-801876932973-446207.png)

#### 1.4.7.4   安装并启动 docker
| yum install -y docker-ce-19.03.8 docker-ce-cli-19.03.8 containerd.io<br/>systemctl enable docker<br/>systemctl start docker<br/>docker version |
| --- |


![1605144975136-9fae07c6-6fa6-44cc-aedd-87df45a4df17.png](./img/4797OHnNvQQn9KN2/1605144975136-9fae07c6-6fa6-44cc-aedd-87df45a4df17-590607.png)

![1605144975235-dff7c80e-0ea7-4002-98bc-dea0c9f9ffe4.png](./img/4797OHnNvQQn9KN2/1605144975235-dff7c80e-0ea7-4002-98bc-dea0c9f9ffe4-544837.png)

![1605144975352-767eb632-dad7-4315-84a9-2ce19c04baeb.png](./img/4797OHnNvQQn9KN2/1605144975352-767eb632-dad7-4315-84a9-2ce19c04baeb-594509.png)

![1605144975479-3dd4894d-ce60-406b-9673-5c54af37be23.png](./img/4797OHnNvQQn9KN2/1605144975479-3dd4894d-ce60-406b-9673-5c54af37be23-244638.png)

![1605144975592-7824e876-8065-45e9-b24e-06be75d32a83.png](./img/4797OHnNvQQn9KN2/1605144975592-7824e876-8065-45e9-b24e-06be75d32a83-091471.png)

#### 1.4.7.5   配置docker加速
##### 1.4.7.5.1     创建docker加速文件夹
| sudo mkdir -p /etc/docker |
| --- |


##### 1.4.7.5.2     登录阿里云获取镜像
![1605144976156-215e3ea3-1b65-44bf-9ca8-a062a40e277f.png](./img/4797OHnNvQQn9KN2/1605144976156-215e3ea3-1b65-44bf-9ca8-a062a40e277f-153189.png)

![1605144976284-b2157478-2149-4f97-afc0-cfe4c21d2d53.png](./img/4797OHnNvQQn9KN2/1605144976284-b2157478-2149-4f97-afc0-cfe4c21d2d53-208162.png)

如果没有的话，需要手动输入“容器镜像服务”。

![1605144976438-32307996-cb55-4b2a-af0b-931f37e30428.png](./img/4797OHnNvQQn9KN2/1605144976438-32307996-cb55-4b2a-af0b-931f37e30428-761444.png)

![1605144976596-1a1e3491-f440-4c6e-b1f8-de0d2a5345e0.png](./img/4797OHnNvQQn9KN2/1605144976596-1a1e3491-f440-4c6e-b1f8-de0d2a5345e0-401826.png)

| sudo tee /etc/docker/daemon.json <<-'EOF'<br/>{<br/>  "registry-mirrors": ["https://11l3ppzn.mirror.aliyuncs.com"]<br/>}<br/>EOF |
| --- |


![1605144976716-7ba63203-db49-4aec-b469-502e5a561a44.png](./img/4797OHnNvQQn9KN2/1605144976716-7ba63203-db49-4aec-b469-502e5a561a44-801319.png)

| systemctl daemon-reload<br/>systemctl restart docker |
| --- |


![1605144976817-cc18ded2-79dc-4a9c-9248-413bddc1fb6a.png](./img/4797OHnNvQQn9KN2/1605144976817-cc18ded2-79dc-4a9c-9248-413bddc1fb6a-682297.png)

### 1.4.8 安装k8s环境
#### 1.4.8.1   安装k8s、kubelet、kubeadm、kubectl（所有节点）
##### 1.4.8.1.1     配置K8S的yum源
| cat <<EOF > /etc/yum.repos.d/kubernetes.repo<br/>[kubernetes]<br/>name=Kubernetes<br/>baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64<br/>enabled=1<br/>gpgcheck=0<br/>repo_gpgcheck=0<br/>gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg<br/>       [http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg](http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg)<br/>EOF |
| --- |


![1605144977057-bc4dfda4-930b-4c41-9efe-f7d63c154848.png](./img/4797OHnNvQQn9KN2/1605144977057-bc4dfda4-930b-4c41-9efe-f7d63c154848-517720.png)

##### 1.4.8.1.2     卸载旧版本
| yum remove -y kubelet kubeadm kubectl |
| --- |
|   |


![1605144977156-5a3ee0a5-0c8d-46a3-b211-b7672ecd32ad.png](./img/4797OHnNvQQn9KN2/1605144977156-5a3ee0a5-0c8d-46a3-b211-b7672ecd32ad-270339.png)

##### 1.4.8.1.3     安装kubelet、kubeadm、kubectl
| yum install -y kubelet-1.17.3 kubeadm-1.17.3 kubectl-1.17.3 |
| --- |


![1605144977311-2dfea713-b65e-49ce-91fb-9d7cda4e6385.png](./img/4797OHnNvQQn9KN2/1605144977311-2dfea713-b65e-49ce-91fb-9d7cda4e6385-616451.png)

![1605144977441-26044284-2f0a-4a80-8ab3-8b2a27bae34f.png](./img/4797OHnNvQQn9KN2/1605144977441-26044284-2f0a-4a80-8ab3-8b2a27bae34f-620108.png)

![1605144977548-acacb737-9746-4ff2-9d33-d16d7262d537.png](./img/4797OHnNvQQn9KN2/1605144977548-acacb737-9746-4ff2-9d33-d16d7262d537-746279.png)

必须等待三台主机安装成功。

##### 1.4.8.1.4     开机启动和重启kubelet
| systemctl enable kubelet && systemctl start kubelet |
| --- |


![1605144977648-2ef57102-e377-4937-9ab5-ae7aa65ddfb8.png](./img/4797OHnNvQQn9KN2/1605144977648-2ef57102-e377-4937-9ab5-ae7aa65ddfb8-040887.png)

注意，如果此时查看kubelet的状态，他会无限重启，等待接收集群命令，和初始化。这个是正常的。

#### 1.4.8.2   初始化所有节点
##### 1.4.8.2.1     创建一个shell脚本内容如下
新建一个shell脚本名称为image.sh

| vi images.sh<br/> <br/>#!/bin/bash<br/>images=(<br/>  kube-apiserver:v1.17.3<br/>    kube-proxy:v1.17.3<br/>  kube-controller-manager:v1.17.3<br/>  kube-scheduler:v1.17.3<br/>  coredns:1.6.5<br/>  etcd:3.4.3-0<br/>    pause:3.1<br/>)<br/>for imageName in ${images[@]} ; do<br/>    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName<br/>done |
| --- |


![1605144977744-579b57f4-7310-4ac2-9bc2-ca91adcd3806.png](./img/4797OHnNvQQn9KN2/1605144977744-579b57f4-7310-4ac2-9bc2-ca91adcd3806-544903.png)

![1605144977874-6eef6c93-43cc-411b-b183-940828d9fa78.png](./img/4797OHnNvQQn9KN2/1605144977874-6eef6c93-43cc-411b-b183-940828d9fa78-948962.png)

##### 1.4.8.2.2     将该脚本授予可执行的权限
| chmod -R 700 images.sh |
| --- |


![1605144978380-abf777b7-0ed8-44f0-8354-30e47e2d72b8.png](./img/4797OHnNvQQn9KN2/1605144978380-abf777b7-0ed8-44f0-8354-30e47e2d72b8-249130.png)

##### 1.4.8.2.3     执行该脚本命令
| ./images.sh               比较慢，耐心等待 |
| --- |


![1605144978511-996d760a-f1ff-4c33-b298-0372e9387bcb.png](./img/4797OHnNvQQn9KN2/1605144978511-996d760a-f1ff-4c33-b298-0372e9387bcb-095965.png)

![1605144978639-cde070fb-18e7-4f0c-ac07-f1a7ae7da0c1.png](./img/4797OHnNvQQn9KN2/1605144978639-cde070fb-18e7-4f0c-ac07-f1a7ae7da0c1-869552.png)

![1605144978765-4becec28-e3cc-47cb-a596-5905aa362574.png](./img/4797OHnNvQQn9KN2/1605144978765-4becec28-e3cc-47cb-a596-5905aa362574-982803.png)

##### 1.4.8.2.4     初始化master节点
注意，该操作只是在master节点之后构建环境。

| kubeadm init \<br/>--apiserver-advertise-address=<font style="color:red;">192.168.142.144 </font>\<br/>--image-repository registry.cn-hangzhou.aliyuncs.com/google_containers \<br/>--kubernetes-version v1.17.3 \<br/>--service-cidr=10.96.0.0/16 \<br/>--pod-network-cidr=10.244.0.0/16 |
| --- |


--apiserver-advertise-address=10.12.0.9

<font style="color:red;">这里的地址需要修改成</font><font style="color:red;">master</font><font style="color:red;">对应的</font><font style="color:red;">IP</font><font style="color:red;">地址。</font>

<font style="color:red;"> </font>

###### 1.4.8.2.4.1    如果输入以上内容报错：
![1605144978894-6f725df0-8e53-4b28-9fa7-4cf12fbf5698.png](./img/4797OHnNvQQn9KN2/1605144978894-6f725df0-8e53-4b28-9fa7-4cf12fbf5698-715111.png)

<font style="color:red;">    [ERROR FileContent--proc-sys-net-bridge-bridge-nf-call-iptables]: /proc/sys/net/bridge/bridge-nf-call-iptables contents are not set to 1</font>

<font style="color:red;">[preflight] If you know what you are doing, you can make a check non-fatal with `--ignore-preflight-errors=...`</font>

<font style="color:red;">To see the stack trace of this error execute with --v=5 or higher</font>

<font style="color:red;"> </font>

<font style="color:red;">解决方案：</font>

<font style="color:#383A42;">echo </font><font style="color:#50A14F;">"1"</font><font style="color:#383A42;"> ></font><font style="color:#50A14F;">/proc/sys/net/bridge/bridge-nf-call-iptables</font>

<font style="color:red;"> </font>

<font style="color:red;"> </font>

![1605144978991-4384ce18-b376-4cbd-9c9e-22980a4caa56.png](./img/4797OHnNvQQn9KN2/1605144978991-4384ce18-b376-4cbd-9c9e-22980a4caa56-715030.png)

![1605144979098-3e7b8b5a-63a9-402c-88dd-c8925ed15a62.png](./img/4797OHnNvQQn9KN2/1605144979098-3e7b8b5a-63a9-402c-88dd-c8925ed15a62-008685.png)

初始化完成。

##### 1.4.8.2.5     配置 kubectl
这里注意的是，一定成初始化成功后面获取复制。

![1605144979221-16ff2ab7-a02d-45b6-a015-31cb3897daeb.png](./img/4797OHnNvQQn9KN2/1605144979221-16ff2ab7-a02d-45b6-a015-31cb3897daeb-476941.png)

 

 

| mkdir -p $HOME/.kube<br/>sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config<br/>sudo chown $(id -u):$(id -g) $HOME/.kube/config |
| --- |


![1605144979311-e10fd4c5-1f3d-4943-8ed2-333e5f5bd26b.png](./img/4797OHnNvQQn9KN2/1605144979311-e10fd4c5-1f3d-4943-8ed2-333e5f5bd26b-207218.png)

##### 1.4.8.2.6     部署网络插件
| kubectl apply -f [https://docs.projectcalico.org/manifests/calico.yaml](https://docs.projectcalico.org/manifests/calico.yaml) |
| --- |


![1605144979462-5bfac815-fc84-4dc5-adb9-9285247b23dd.png](./img/4797OHnNvQQn9KN2/1605144979462-5bfac815-fc84-4dc5-adb9-9285247b23dd-620249.png)

##### 1.4.8.2.7     查看节点运行的情况
| kubectl get nodes |
| --- |


![1605144979572-613374a4-3179-4f61-9ee4-7b796ef2b064.png](./img/4797OHnNvQQn9KN2/1605144979572-613374a4-3179-4f61-9ee4-7b796ef2b064-583513.png)

##### 1.4.8.2.8     查看所有的pod的运行的情况
| kubectl get pods -A  |
| --- |


![1605144979657-397b4329-02a3-49ce-8dd0-a6051e535593.png](./img/4797OHnNvQQn9KN2/1605144979657-397b4329-02a3-49ce-8dd0-a6051e535593-092097.png)

这里需要注意的是，必须等所有的状态为Runing才能进行下一步操作。

 

###### 1.4.8.2.8.1    如果上面操作导致pod有报错：
比如爆

error: the server doesn't have a resource type "calico-kube-controllers-544658cf79-bv5mj"

这个异常

![1605144979870-ce959791-ba03-4169-8819-bbbb5824a197.png](./img/4797OHnNvQQn9KN2/1605144979870-ce959791-ba03-4169-8819-bbbb5824a197-721249.png)

 

解决： 可以试下<font style="color:#4D4D4D;">重启</font><font style="color:#4D4D4D;">一下</font><font style="color:#4D4D4D;">kubelet</font><font style="color:#4D4D4D;">服务</font><font style="color:#4D4D4D;">，然后等待一下，应该就可以了</font>

systemctl restart kubelet 

##### 1.4.8.2.9     执行令牌（在从节点操作）
这里注意的是，一定成初始化成功后面获取复制。

![1605144980058-1e3e306a-facb-4488-b572-e82df977fb9f.png](./img/4797OHnNvQQn9KN2/1605144980058-1e3e306a-facb-4488-b572-e82df977fb9f-736192.png)

| kubeadm join 192.168.142.138:6443 --token 8yvi2m.466nhemzvyqcxkny     --discovery-token-ca-cert-hash sha256:99a5fdcb4af4dd9c2ee40e48ba420d7630676a77a3c0f2445c260921fdcaf83a<br/> <br/> <br/>如果在两个从节点运行执行令牌报错：<br/>   [ERROR FileContent--proc-sys-net-bridge-bridge-nf-call-iptables]: /proc/sys/net/bridge/bridge-nf-call-iptables contents are not set to 1<br/>[preflight] If you know what you are doing, you can make a check non-fatal with `--ignore-preflight-errors=...`<br/>To see the stack trace of this error execute with --v=5 or higher<br/> <br/>解决方案，两个从节点都执行以下命令：<br/>echo "1" >/proc/sys/net/bridge/bridge-nf-call-iptables |
| --- |
|  <br/><font style="color:rgb(106, 115, 125);">#</font><font style="color:rgb(106, 115, 125);">1</font><font style="color:rgb(106, 115, 125);">、如果超过</font><font style="color:rgb(106, 115, 125);">2</font><font style="color:rgb(106, 115, 125);">小时忘记了令牌，可以这样做</font><font style="color:rgb(89, 89, 89);">kubeadm token create </font><font style="color:rgb(111, 66, 193);">--print-join-command</font><font style="color:rgb(89, 89, 89);"> </font><font style="color:rgb(106, 115, 125);">#</font><font style="color:rgb(106, 115, 125);">打印新令牌</font><br/><font style="color:#595959;">kubeadm token create </font><font style="color:#6F42C1;">--ttl</font><font style="color:#595959;"> </font><font style="color:#005CC5;">0</font><font style="color:#595959;"> </font><font style="color:#6F42C1;">--print-join-command</font><font style="color:#595959;"> </font><font style="color:#6A737D;">#</font><font style="color:#6A737D;">创建个永不过期的令牌</font><br/>  |


![1605144980277-48de6470-f40b-4d85-ae41-11bd0850eedd.png](./img/4797OHnNvQQn9KN2/1605144980277-48de6470-f40b-4d85-ae41-11bd0850eedd-801906.png)

![1605144980418-61cd6f57-dfec-4416-9392-d954ed8b0b51.png](./img/4797OHnNvQQn9KN2/1605144980418-61cd6f57-dfec-4416-9392-d954ed8b0b51-215491.png)

加入令牌完成。

##### 1.4.8.2.10   在主节点查看节点运行的情况
| kubectl get nodes |
| --- |


![1605144980761-da945135-13cd-43b5-839c-5c4a3a7a4555.png](./img/4797OHnNvQQn9KN2/1605144980761-da945135-13cd-43b5-839c-5c4a3a7a4555-187388.png)

##### 1.4.8.2.11   查看所有的pod的运行的情况
| kubectl get pods -A |
| --- |


![1605144980861-1d6ba54b-bc3a-4cc7-a9a7-2272d1f9dcac.png](./img/4797OHnNvQQn9KN2/1605144980861-1d6ba54b-bc3a-4cc7-a9a7-2272d1f9dcac-634397.png)

![1605144980973-1dcc323d-8a2a-4382-b49a-bf7263a515c2.png](./img/4797OHnNvQQn9KN2/1605144980973-1dcc323d-8a2a-4382-b49a-bf7263a515c2-732073.png)

这里需要注意的是，必须等所有的状态为Runing才能进行下一步操作。

### 1.4.9 搭建NFS作为默认sc（所有节点）
#### 1.4.9.1   配置NFS服务器
| yum install -y nfs-utils<br/> <br/>echo "/nfs/data/ *(insecure,rw,sync,no_root_squash)" > /etc/exports |
| --- |


![1605144981079-1ebd62c0-6344-44f3-93e1-8cb693912208.png](./img/4797OHnNvQQn9KN2/1605144981079-1ebd62c0-6344-44f3-93e1-8cb693912208-117039.png)

![1605144981205-c7cb9b81-6d12-4372-a98f-d097f1ce5f21.png](./img/4797OHnNvQQn9KN2/1605144981205-c7cb9b81-6d12-4372-a98f-d097f1ce5f21-053469.png)

#### 1.4.9.2   创建nfs服务器目录（主节点作为服务器，主节点操作）
| mkdir -p /nfs/data |
| --- |


![1605144981313-15a26997-abae-4e10-8adc-13779bc2731f.png](./img/4797OHnNvQQn9KN2/1605144981313-15a26997-abae-4e10-8adc-13779bc2731f-732950.png)

#### 1.4.9.3   启动nfs服务命令
| systemctl enable rpcbind<br/>systemctl enable nfs-server<br/>systemctl start rpcbind<br/>systemctl start nfs-server<br/>exportfs -r |
| --- |


![1605144981428-c9b0324e-f858-4934-81c9-039027a0faa8.png](./img/4797OHnNvQQn9KN2/1605144981428-c9b0324e-f858-4934-81c9-039027a0faa8-120794.png)

#### 1.4.9.4   检查配置是否生效
| exportfs |
| --- |


![1605144981537-77503d26-f621-4bee-99c9-39a6837f0b4b.png](./img/4797OHnNvQQn9KN2/1605144981537-77503d26-f621-4bee-99c9-39a6837f0b4b-456638.png)

#### 1.4.9.5   测试Pod直接挂载NFS了（主节点操作）
##### 1.4.9.5.1     在opt目录下创建一个nginx.yaml的文件
| vim nginx.yaml |
| --- |


##### 1.4.9.5.2     写入以下的命令
| apiVersion: v1<br/>kind: Pod<br/>metadata:<br/>  name: vol-nfs<br/>  namespace: default<br/>spec:<br/>  volumes:<br/>  - name: html<br/>    nfs:<br/>      path: /nfs/data   #1000G<br/>      <font style="color:red;">server: 192.168.142.144 #</font><font style="color:red;">自己的</font><font style="color:red;">nfs</font><font style="color:red;">服务器地址</font><br/>  containers:<br/>  - name: myapp<br/>    image: nginx<br/>    volumeMounts:<br/>    - name: html<br/>      mountPath: /usr/share/nginx/html/ |
| --- |


这里注意：server: 10.12.0.9 #自己的nfs服务器地址

![1605144981652-67f4a6a2-92aa-4a1d-bafd-42cd1ce1b78c.png](./img/4797OHnNvQQn9KN2/1605144981652-67f4a6a2-92aa-4a1d-bafd-42cd1ce1b78c-816280.png)

##### 1.4.9.5.3     应用该yaml的pod服务
| kubectl apply -f nginx.yaml |
| --- |


![1605144981754-c6eb1199-5a4c-4ae7-8125-273b663079b4.png](./img/4797OHnNvQQn9KN2/1605144981754-c6eb1199-5a4c-4ae7-8125-273b663079b4-776866.png)

##### 1.4.9.5.4     检查该pod是否允许状态
| kubectl get pod |
| --- |


![1605144981852-a095278a-dc9c-4652-898d-c9b4dde9e570.png](./img/4797OHnNvQQn9KN2/1605144981852-a095278a-dc9c-4652-898d-c9b4dde9e570-903850.png)

kubectl get pods -A

![1605144981963-bd716ffd-74d2-4d39-8d72-abb63777757c.png](./img/4797OHnNvQQn9KN2/1605144981963-bd716ffd-74d2-4d39-8d72-abb63777757c-361370.png)

这里需要注意的是，必须等所有的状态为Runing才能进行下一步操作。

##### 1.4.9.5.5     查看nginx的pod的IP访问地址
| kubectl get pod -o wide |
| --- |


![1605144982078-acbb8801-59ee-4efb-9fa7-f8416facbc05.png](./img/4797OHnNvQQn9KN2/1605144982078-acbb8801-59ee-4efb-9fa7-f8416facbc05-789968.png)

访问地址: 10.244.107.193

##### 1.4.9.5.6     本地测试访问pod信息
| curl 10.244.107.193 |
| --- |


![1605144982210-9bdbd5e0-7895-42b4-84fd-0575fde0af62.png](./img/4797OHnNvQQn9KN2/1605144982210-9bdbd5e0-7895-42b4-84fd-0575fde0af62-458493.png)

这里我们看到的是访问的页面是403，我们可以访问具体页面

我们需要在/nfs/data/下新建一个index.html文件。

| cd /nfs/data/<br/>vim index.html |
| --- |


![1605144982293-56ace4ab-d33f-404f-8fd7-55b438e46043.png](./img/4797OHnNvQQn9KN2/1605144982293-56ace4ab-d33f-404f-8fd7-55b438e46043-380060.png)

##### 1.4.9.5.7     再次测试访问pod信息
| curl 10.244.107.193 |
| --- |


![1605144982385-29b01300-c8c8-4bb6-928a-d300bb749302.png](./img/4797OHnNvQQn9KN2/1605144982385-29b01300-c8c8-4bb6-928a-d300bb749302-090379.png)

### 1.4.10   搭建NFS-Client
服务器端防火墙开放111、662、875、892、2049的 tcp / udp 允许，否则远端客户无法连接。

#### 1.4.10.1  安装客户端工具（node节点操作）
| showmount -e 192.168.142.144 |
| --- |


该IP地址是master的IP地址。

![1605144982530-7f65b9d6-3a5f-49f0-b1d5-0563bcb89d3c.png](./img/4797OHnNvQQn9KN2/1605144982530-7f65b9d6-3a5f-49f0-b1d5-0563bcb89d3c-659915.png)

#### 1.4.10.2  创建同步文件夹
| mkdir /root/nfsmount<br/>ls /root |
| --- |


![1605144982664-97c12a08-a732-464e-8f32-cab6f660eea3.png](./img/4797OHnNvQQn9KN2/1605144982664-97c12a08-a732-464e-8f32-cab6f660eea3-578095.png)

#### 1.4.10.3  将客户端的/root/nfsmount和/nfs/data/做同步（node节点操作）
| mount -t nfs 192.168.142.144:/nfs/data/ /root/nfsmount |
| --- |


10.12.0.9：是nfs的服务器的地址，这里是master的IP地址。

![1605144982780-5cb0993b-768f-41e2-a35f-262058c6fb88.png](./img/4797OHnNvQQn9KN2/1605144982780-5cb0993b-768f-41e2-a35f-262058c6fb88-431884.png)

#### 1.4.10.4  查看原来的文件信息（从）机器
| cat index.html |
| --- |


![1605144982867-7e0994c8-ecee-4fd0-93f9-d19c18974cf3.png](./img/4797OHnNvQQn9KN2/1605144982867-7e0994c8-ecee-4fd0-93f9-d19c18974cf3-818155.png)

#### 1.4.10.5  修改原来的文件信息（主）机器
| cat index.html |
| --- |


![1605144982967-2e390a8f-34c0-4312-947e-8eead884c5f1.png](./img/4797OHnNvQQn9KN2/1605144982967-2e390a8f-34c0-4312-947e-8eead884c5f1-416788.png)

#### 1.4.10.6  在另外的机器上查看效果
| cat index.html |
| --- |


![1605144982967-2e390a8f-34c0-4312-947e-8eead884c5f1.png](./img/4797OHnNvQQn9KN2/1605144982967-2e390a8f-34c0-4312-947e-8eead884c5f1-416788.png)

![1605144983096-2e5fc01b-5b4b-4c6c-8dd9-39c2789d6b08.png](./img/4797OHnNvQQn9KN2/1605144983096-2e5fc01b-5b4b-4c6c-8dd9-39c2789d6b08-243695.png)

![1605144983216-b5211e13-2955-43c5-95fd-ac9edee9a97d.png](./img/4797OHnNvQQn9KN2/1605144983216-b5211e13-2955-43c5-95fd-ac9edee9a97d-895824.png)

### 1.4.11   设置动态供应
![1605144983349-14bc8fc8-83f8-4967-9275-e98721deeb18.png](./img/4797OHnNvQQn9KN2/1605144983349-14bc8fc8-83f8-4967-9275-e98721deeb18-135083.png)

#### 1.4.11.1  创建provisioner（NFS环境前面已经搭好）
| 字段名称 | 填入内容 | 备注 |
| --- | --- | --- |
| 名称 | nfs-storage | 自定义存储类名称 |
| NFS Server | 192.168.142.147 | NFS服务的IP地址 |
| NFS Path | /nfs/data | NFS服务所共享的路径 |


##### 1.4.11.1.1   <font style="color:white;">先创建授权（</font>master节点操作）
| vim nfs-rbac.yaml  在opt目录下 |
| --- |


新建内容如下：

| ---<br/>apiVersion: v1<br/>kind: ServiceAccount<br/>metadata:<br/>  name: nfs-provisioner<br/>---<br/>kind: ClusterRole<br/>apiVersion: rbac.authorization.k8s.io/v1<br/>metadata:<br/>   name: nfs-provisioner-runner<br/>rules:<br/>   -  apiGroups: [""]<br/>      resources: ["persistentvolumes"]<br/>      verbs: ["get", "list", "watch", "create", "delete"]<br/>   -  apiGroups: [""]<br/>      resources: ["persistentvolumeclaims"]<br/>      verbs: ["get", "list", "watch", "update"]<br/>   -  apiGroups: ["storage.k8s.io"]<br/>      resources: ["storageclasses"]<br/>      verbs: ["get", "list", "watch"]<br/>   -  apiGroups: [""]<br/>      resources: ["events"]<br/>      verbs: ["watch", "create", "update", "patch"]<br/>   -  apiGroups: [""]<br/>      resources: ["services", "endpoints"]<br/>      verbs: ["get","create","list", "watch","update"]<br/>   -  apiGroups: ["extensions"]<br/>      resources: ["podsecuritypolicies"]<br/>      resourceNames: ["nfs-provisioner"]<br/>      verbs: ["use"]<br/>---<br/>kind: ClusterRoleBinding<br/>apiVersion: rbac.authorization.k8s.io/v1<br/>metadata:<br/>  name: run-nfs-provisioner<br/>subjects:<br/>  - kind: ServiceAccount<br/>    name: nfs-provisioner<br/>    namespace: default<br/>roleRef:<br/>  kind: ClusterRole<br/>  name: nfs-provisioner-runner<br/>  apiGroup: rbac.authorization.k8s.io<br/>---<br/>kind: Deployment<br/>apiVersion: apps/v1<br/>metadata:<br/>   name: nfs-client-provisioner<br/>spec:<br/>   replicas: 1<br/>   strategy:<br/>     type: Recreate<br/>   selector:<br/>     matchLabels:<br/>        app: nfs-client-provisioner<br/>   template:<br/>      metadata:<br/>         labels:<br/>            app: nfs-client-provisioner<br/>      spec:<br/>         serviceAccount: nfs-provisioner<br/>         containers:<br/>            -  name: nfs-client-provisioner<br/>               image: lizhenliang/nfs-client-provisioner<br/>               volumeMounts:<br/>                 -  name: nfs-client-root<br/>                    mountPath:  /persistentvolumes<br/>               env:<br/>                 -  name: PROVISIONER_NAME<br/>                    value: storage.pri/nfs<br/>                 -  name: NFS_SERVER<br/>                    value: <font style="color:red;">192.168.142.144</font><br/>                 -  name: NFS_PATH<br/>                    value: /nfs/data<br/>         volumes:<br/>           - name: nfs-client-root<br/>             nfs:<br/>               server: <font style="color:red;">192.168.142.144</font><br/>               path: /nfs/data |
| --- |


这个镜像中volume的mountPath默认为/persistentvolumes，不能修改，否则运行时会报错。红色的必须是自己的master的IP地址。

![1605144983531-46176853-9fad-4e23-9c88-6b1d4701ac05.png](./img/4797OHnNvQQn9KN2/1605144983531-46176853-9fad-4e23-9c88-6b1d4701ac05-783020.png)

##### 1.4.11.1.2   执行创建nfs的yaml文件信息
| kubectl apply -f nfs-rbac.yaml |
| --- |


![1605144983706-50214e9e-718c-41f6-952d-1a275175477d.png](./img/4797OHnNvQQn9KN2/1605144983706-50214e9e-718c-41f6-952d-1a275175477d-750132.png)

 

##### 1.4.11.1.3   如果发现pod有问题，想删除pod进行重新kubectl apply-f nfs-rbac.yaml的话，可以参照这个博客文档：
[https://blog.csdn.net/qq_43542988/article/details/101277263?utm_medium=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param](https://blog.csdn.net/qq_43542988/article/details/101277263?utm_medium=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param)

##### 1.4.11.1.4   查看pod的状态信息
| kubectl get pods -A<br/> <br/>如果报错：查看报错信息，这个命令：<br/>kubectl describe pod xxx -n kube-system |
| --- |


![1605144983826-3732a003-b9c3-4540-84a8-50911ff48447.png](./img/4797OHnNvQQn9KN2/1605144983826-3732a003-b9c3-4540-84a8-50911ff48447-156373.png)

##### 1.4.11.1.5   创建storageclass（master节点操作）
| vim storageclass-nfs.yaml<br/> <br/>apiVersion: storage.k8s.io/v1<br/>kind: StorageClass<br/>metadata:<br/>  name: storage-nfs<br/>provisioner: storage.pri/nfs<br/>reclaimPolicy: Delete |
| --- |


##### 1.4.11.1.6   应用storageclass-nfs.yaml文件
| kubectl apply -f storageclass-nfs.yaml |
| --- |


![1605144983925-c714195f-2783-47c4-8398-a1c5ca24034e.png](./img/4797OHnNvQQn9KN2/1605144983925-c714195f-2783-47c4-8398-a1c5ca24034e-096903.png)

##### 1.4.11.1.7   修改默认的驱动
| kubectl patch storageclass storage-nfs -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}' |
| --- |


![1605144984041-0c94cee1-0391-4b22-ac0c-e4e8439a4bf6.png](./img/4797OHnNvQQn9KN2/1605144984041-0c94cee1-0391-4b22-ac0c-e4e8439a4bf6-456914.png)

| kubectl get sc |
| --- |


![1605144984140-25f8df61-113f-4877-89d6-8fa147974de6.png](./img/4797OHnNvQQn9KN2/1605144984140-25f8df61-113f-4877-89d6-8fa147974de6-026263.png)

### 1.4.12   安装metrics-server
#### 1.4.12.1  准备metrics-server.yaml文件（主节点操作）
| vim metrics-server.yaml |
| --- |


#### 1.4.12.2  编写以下的内容
![1605144984269-826a5f09-a0d3-4111-9924-e4b74954be66.png](./img/4797OHnNvQQn9KN2/1605144984269-826a5f09-a0d3-4111-9924-e4b74954be66-248018.png)

| ---<br/>apiVersion: rbac.authorization.k8s.io/v1<br/>kind: ClusterRole<br/>metadata:<br/>  name: system:aggregated-metrics-reader<br/>  labels:<br/>    rbac.authorization.k8s.io/aggregate-to-view: "true"<br/>    rbac.authorization.k8s.io/aggregate-to-edit: "true"<br/>    rbac.authorization.k8s.io/aggregate-to-admin: "true"<br/>rules:<br/>- apiGroups: ["metrics.k8s.io"]<br/>  resources: ["pods", "nodes"]<br/>  verbs: ["get", "list", "watch"]<br/>---<br/>apiVersion: rbac.authorization.k8s.io/v1<br/>kind: ClusterRoleBinding<br/>metadata:<br/>  name: metrics-server:system:auth-delegator<br/>roleRef:<br/>  apiGroup: rbac.authorization.k8s.io<br/>  kind: ClusterRole<br/>  name: system:auth-delegator<br/>subjects:<br/>- kind: ServiceAccount<br/>  name: metrics-server<br/>  namespace: kube-system<br/>---<br/>apiVersion: rbac.authorization.k8s.io/v1<br/>kind: RoleBinding<br/>metadata:<br/>  name: metrics-server-auth-reader<br/>  namespace: kube-system<br/>roleRef:<br/>  apiGroup: rbac.authorization.k8s.io<br/>  kind: Role<br/>  name: extension-apiserver-authentication-reader<br/>subjects:<br/>- kind: ServiceAccount<br/>  name: metrics-server<br/>  namespace: kube-system<br/>---<br/>apiVersion: apiregistration.k8s.io/v1beta1<br/>kind: APIService<br/>metadata:<br/>  name: v1beta1.metrics.k8s.io<br/>spec:<br/>  service:<br/>    name: metrics-server<br/>    namespace: kube-system<br/>  group: metrics.k8s.io<br/>  version: v1beta1<br/>  insecureSkipTLSVerify: true<br/>  groupPriorityMinimum: 100<br/>  versionPriority: 100<br/>---<br/>apiVersion: v1<br/>kind: ServiceAccount<br/>metadata:<br/>  name: metrics-server<br/>  namespace: kube-system<br/>---<br/>apiVersion: apps/v1<br/>kind: Deployment<br/>metadata:<br/>  name: metrics-server<br/>  namespace: kube-system<br/>  labels:<br/>    k8s-app: metrics-server<br/>spec:<br/>  selector:<br/>    matchLabels:<br/>      k8s-app: metrics-server<br/>  template:<br/>    metadata:<br/>      name: metrics-server<br/>      labels:<br/>        k8s-app: metrics-server<br/>    spec:<br/>      serviceAccountName: metrics-server<br/>      volumes:<br/>      # mount in tmp so we can safely use from-scratch images and/or read-only containers<br/>      - name: tmp-dir<br/>        emptyDir: {}<br/>      containers:<br/>      - name: metrics-server<br/>        image: mirrorgooglecontainers/metrics-server-amd64:v0.3.6<br/>        imagePullPolicy: IfNotPresent<br/>        args:<br/>          - --cert-dir=/tmp<br/>          - --secure-port=4443<br/>          - --kubelet-insecure-tls<br/>          - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname<br/>        ports:<br/>        - name: main-port<br/>          containerPort: 4443<br/>          protocol: TCP<br/>        securityContext:<br/>          readOnlyRootFilesystem: true<br/>          runAsNonRoot: true<br/>          runAsUser: 1000<br/>        volumeMounts:<br/>        - name: tmp-dir<br/>          mountPath: /tmp<br/>      nodeSelector:<br/>        kubernetes.io/os: linux<br/>        kubernetes.io/arch: "amd64"<br/>---<br/>apiVersion: v1<br/>kind: Service<br/>metadata:<br/>  name: metrics-server<br/>  namespace: kube-system<br/>  labels:<br/>    kubernetes.io/name: "Metrics-server"<br/>    kubernetes.io/cluster-service: "true"<br/>spec:<br/>  selector:<br/>    k8s-app: metrics-server<br/>  ports:<br/>  - port: 443<br/>    protocol: TCP<br/>    targetPort: main-port<br/>---<br/>apiVersion: rbac.authorization.k8s.io/v1<br/>kind: ClusterRole<br/>metadata:<br/>  name: system:metrics-server<br/>rules:<br/>- apiGroups:<br/>  - ""<br/>  resources:<br/>  - pods<br/>  - nodes<br/>  - nodes/stats<br/>  - namespaces<br/>  - configmaps<br/>  verbs:<br/>  - get<br/>  - list<br/>  - watch<br/>---<br/>apiVersion: rbac.authorization.k8s.io/v1<br/>kind: ClusterRoleBinding<br/>metadata:<br/>  name: system:metrics-server<br/>roleRef:<br/>  apiGroup: rbac.authorization.k8s.io<br/>  kind: ClusterRole<br/>  name: system:metrics-server<br/>subjects:<br/>- kind: ServiceAccount<br/>  name: metrics-server<br/>  namespace: kube-system |
| --- |


#### 1.4.12.3  应用该文件pod
| kubectl apply -f metrics-server.yaml |
| --- |


![1605144984410-a9b9169d-e903-4f17-839a-19b5089b2b2e.png](./img/4797OHnNvQQn9KN2/1605144984410-a9b9169d-e903-4f17-839a-19b5089b2b2e-719547.png)

#### 1.4.12.4  查看部署的应用信息状态
| kubectl get pod -A |
| --- |


![1605144984511-3ef6d531-bdd2-4a6e-bee5-e27dbb463311.png](./img/4797OHnNvQQn9KN2/1605144984511-3ef6d531-bdd2-4a6e-bee5-e27dbb463311-794890.png)

#### 1.4.12.5  查看系统的监控状态
| kubectl top nodes<br/> <br/>如果运行kubectl top nodes这个命令，爆metrics not available yet 这个命令还没有用，那就稍等一会，就能用了 |
| --- |


![1605144984631-43080451-7e5c-48fb-bd24-98cad9ea65e1.png](./img/4797OHnNvQQn9KN2/1605144984631-43080451-7e5c-48fb-bd24-98cad9ea65e1-680104.png)

这里，kubesphere3.0的前置环境全部结束。

## 1.5 安装kubesphere v3.0.0
### 1.5.1 文档地址
[<font style="color:#404040;">https://kubesphere.com.cn/</font>](https://kubesphere.com.cn/)

### 1.5.2 部署文档地址
[<font style="color:#404040;">https://kubesphere.com.cn/docs/quick-start/minimal-kubesphere-on-k8s/</font>](https://kubesphere.com.cn/docs/quick-start/minimal-kubesphere-on-k8s/)

### 1.5.3 安装步骤说明（master节点）
#### 1.5.3.1   安装集群配置文件
##### 1.5.3.1.1     准备配置文件cluster-configuration.yaml
| vim cluster-configuration.yaml |
| --- |


##### 1.5.3.1.2     编写以下的内容配置
![1605144984743-9513514f-a520-4fe4-b527-979cea330a42.png](./img/4797OHnNvQQn9KN2/1605144984743-9513514f-a520-4fe4-b527-979cea330a42-204867.png)

| ---<br/>apiVersion: installer.kubesphere.io/v1alpha1<br/>kind: ClusterConfiguration<br/>metadata:<br/>  name: ks-installer<br/>  namespace: kubesphere-system<br/>  labels:<br/>    version: v3.0.0<br/>spec:<br/>  persistence:<br/>    storageClass: ""        # If there is not a default StorageClass in your cluster, you need to specify an existing StorageClass here.<br/>  authentication:<br/>    jwtSecret: ""           # Keep the jwtSecret consistent with the host cluster. Retrive the jwtSecret by executing "kubectl -n kubesphere-system get cm kubesphere-config -o yaml | grep -v "apiVersion" | grep jwtSecret" on the host cluster.<br/>  etcd:<br/>    monitoring: true       # Whether to enable etcd monitoring dashboard installation. You have to create a secret for etcd before you enable it.<br/>    <font style="color:red;">endpointIps: 10.12.0.9 </font> # etcd cluster EndpointIps, it can be a bunch of IPs here.<br/>    port: 2379              # etcd port<br/>    tlsEnable: true<br/>  common:<br/>    mysqlVolumeSize: 20Gi # MySQL PVC size.<br/>    minioVolumeSize: 20Gi # Minio PVC size.<br/>    etcdVolumeSize: 20Gi  # etcd PVC size.<br/>    openldapVolumeSize: 2Gi   # openldap PVC size.<br/>    redisVolumSize: 2Gi # Redis PVC size.<br/>    es:   # Storage backend for logging, events and auditing.<br/>      # elasticsearchMasterReplicas: 1   # total number of master nodes, it's not allowed to use even number<br/>      # elasticsearchDataReplicas: 1     # total number of data nodes.<br/>      elasticsearchMasterVolumeSize: 4Gi   # Volume size of Elasticsearch master nodes.<br/>      elasticsearchDataVolumeSize: 20Gi    # Volume size of Elasticsearch data nodes.<br/>      logMaxAge: 7                     # Log retention time in built-in Elasticsearch, it is 7 days by default.<br/>      elkPrefix: logstash              # The string making up index names. The index name will be formatted as ks-<elk_prefix>-log.<br/>  console:<br/>    enableMultiLogin: true  # enable/disable multiple sing on, it allows an account can be used by different users at the same time.<br/>    port: 30880<br/>  alerting:                # (CPU: 0.3 Core, Memory: 300 MiB) Whether to install KubeSphere alerting system. It enables Users to customize alerting policies to send messages to receivers in time with different time intervals and alerting levels to choose from.<br/>    enabled: true<br/>  auditing:                # Whether to install KubeSphere audit log system. It provides a security-relevant chronological set of records，recording the sequence of activities happened in platform, initiated by different tenants.<br/>    enabled: true<br/>  devops:                  # (CPU: 0.47 Core, Memory: 8.6 G) Whether to install KubeSphere DevOps System. It provides out-of-box CI/CD system based on Jenkins, and automated workflow tools including Source-to-Image & Binary-to-Image.<br/>    enabled: true<br/>    jenkinsMemoryLim: 2Gi      # Jenkins memory limit.<br/>    jenkinsMemoryReq: 1500Mi   # Jenkins memory request.<br/>    jenkinsVolumeSize: 8Gi     # Jenkins volume size.<br/>    jenkinsJavaOpts_Xms: 512m  # The following three fields are JVM parameters.<br/>    jenkinsJavaOpts_Xmx: 512m<br/>    jenkinsJavaOpts_MaxRAM: 2g<br/>  events:                  # Whether to install KubeSphere events system. It provides a graphical web console for Kubernetes Events exporting, filtering and alerting in multi-tenant Kubernetes clusters.<br/>    enabled: true<br/>    ruler:<br/>      enabled: true<br/>      replicas: 2<br/>  logging:                 # (CPU: 57 m, Memory: 2.76 G) Whether to install KubeSphere logging system. Flexible logging functions are provided for log query, collection and management in a unified console. Additional log collectors can be added, such as Elasticsearch, Kafka and Fluentd.<br/>    enabled: true<br/>    logsidecarReplicas: 2<br/>  metrics_server:                    # (CPU: 56 m, Memory: 44.35 MiB) Whether to install metrics-server. IT enables HPA (Horizontal Pod Autoscaler).<br/>    enabled: false<br/>  monitoring:<br/>    # prometheusReplicas: 1            # Prometheus replicas are responsible for monitoring different segments of data source and provide high availability as well.<br/>    prometheusMemoryRequest: 400Mi   # Prometheus request memory.<br/>    prometheusVolumeSize: 20Gi       # Prometheus PVC size.<br/>    # alertmanagerReplicas: 1          # AlertManager Replicas.<br/>  multicluster:<br/>    clusterRole: none  # host | member | none  # You can install a solo cluster, or specify it as the role of host or member cluster.<br/>  networkpolicy:       # Network policies allow network isolation within the same cluster, which means firewalls can be set up between certain instances (Pods).<br/>    # Make sure that the CNI network plugin used by the cluster supports NetworkPolicy. There are a number of CNI network plugins that support NetworkPolicy, including Calico, Cilium, Kube-router, Romana and Weave Net.<br/>    enabled: true<br/>  notification:        # Email Notification support for the legacy alerting system, should be enabled/disabled together with the above alerting option.<br/>    enabled: true<br/>  openpitrix:          # (2 Core, 3.6 G) Whether to install KubeSphere Application Store. It provides an application store for Helm-based applications, and offer application lifecycle management.<br/>    enabled: true<br/>  servicemesh:         # (0.3 Core, 300 MiB) Whether to install KubeSphere Service Mesh (Istio-based). It provides fine-grained traffic management, observability and tracing, and offer visualization for traffic topology.<br/>    enabled: true |
| --- |


endpointIps: 10.12.0.9：master节点的地址。

##### 1.5.3.1.3     准备配置文件kubesphere-installer.yaml文件
![1605144984883-eba4f748-9757-45ba-9999-528fca5e65f3.png](./img/4797OHnNvQQn9KN2/1605144984883-eba4f748-9757-45ba-9999-528fca5e65f3-311482.png)

##### 1.5.3.1.4     分别执行两个文件
| kubectl apply -f kubesphere-installer.yaml<br/>kubectl apply -f cluster-configuration.yaml |
| --- |


![1605144985006-71fd5e18-b5af-4fd9-8de2-9c27b5ab7c64.png](./img/4797OHnNvQQn9KN2/1605144985006-71fd5e18-b5af-4fd9-8de2-9c27b5ab7c64-619268.png)

![1605144985094-d171f565-042c-4744-b39a-c0fa15e95588.png](./img/4797OHnNvQQn9KN2/1605144985094-d171f565-042c-4744-b39a-c0fa15e95588-903413.png)

##### 1.5.3.1.5     监控安装的日志信息
| kubectl logs -n kubesphere-system $(kubectl get pod -n kubesphere-system -l app=ks-install -o jsonpath='{.items[0].metadata.name}') -f |
| --- |


![1605144985207-9e1af7a5-08ab-4217-8154-3b791c55cbf8.png](./img/4797OHnNvQQn9KN2/1605144985207-9e1af7a5-08ab-4217-8154-3b791c55cbf8-568956.png)

![1605144985322-ce907665-a51c-428a-ab7e-f76d9c5147a7.png](./img/4797OHnNvQQn9KN2/1605144985322-ce907665-a51c-428a-ab7e-f76d9c5147a7-500573.png)

##### 1.5.3.1.6     查看pod启动状态信息
| kubectl get pods -A |
| --- |


![1605144985477-ac699da6-a16b-4fd5-a2c4-565bcb32376d.png](./img/4797OHnNvQQn9KN2/1605144985477-ac699da6-a16b-4fd5-a2c4-565bcb32376d-547779.png)

需要等待漫长的时间。喝杯茶，抽支烟。

 

 

### 1.5.4 访问验证是否安装成功
访问地址：

[http://192.168.142.141:30880/login](http://192.168.142.141:30880/login)

 

帐号：admin

密码：P@88w0rd

![1605144985606-9d85667b-5422-45b8-a593-4123d34a3331.png](./img/4797OHnNvQQn9KN2/1605144985606-9d85667b-5422-45b8-a593-4123d34a3331-977197.png)

![1605144985700-8883dd6d-a0e8-43ba-8d42-c524bd639d56.png](./img/4797OHnNvQQn9KN2/1605144985700-8883dd6d-a0e8-43ba-8d42-c524bd639d56-316219.png)

 

###### 1.5.4.1.1.1    解决prometheus一直没能Running的问题，缺少证书
 

如等待了半个小时左右还是没能Running,特别是monitoring这两个有问题，这个是监控用的

![1605144985831-d8e02c5e-67fb-4214-b87e-c2c280fd2ef3.png](./img/4797OHnNvQQn9KN2/1605144985831-d8e02c5e-67fb-4214-b87e-c2c280fd2ef3-528802.png)

 

那么说明出现问题了，我们来查看一下 

kubectl describe pod prometheus-k8s-0  -n kubesphere-monitoring-system

![1605144985974-2230686d-b443-4c4d-a01a-911cb5a8f200.png](./img/4797OHnNvQQn9KN2/1605144985974-2230686d-b443-4c4d-a01a-911cb5a8f200-431941.png)

说没有这个secret-kube-etcd-client-certs这个证书

 

看一下kubesphere的整个apiserver

<font style="color:#6F42C1;">ps</font><font style="color:#595959;"> </font><font style="color:#6F42C1;">-ef</font><font style="color:#595959;">|grep kube-apiserver</font><font style="color:#595959;"> </font>

<font style="color:#595959;">这个</font>apiserver就会打印整个证书位置

![1605144986100-a197a595-ba35-4f9b-b330-d63f6183e0b3.png](./img/4797OHnNvQQn9KN2/1605144986100-a197a595-ba35-4f9b-b330-d63f6183e0b3-389410.png)

说明是有这些证书文件的，但是kubesphere它不知道，它相当于依赖了我们系统里面的

 

这些证书文件就是在这些位置：

<font style="color:#6F42C1;">--etcd-cafile</font><font style="color:#D73A49;">=</font><font style="color:#595959;">/etc/kubernetes/pki/etcd/ca.crt </font>

<font style="color:#6F42C1;">--etcd-certfile</font><font style="color:#D73A49;">=</font><font style="color:#595959;">/etc/kubernetes/pki/apiserver-etcd-client.crt </font>

<font style="color:#6F42C1;">--etcd-keyfile</font><font style="color:#D73A49;">=</font><font style="color:#595959;">/etc/kubernetes/pki/apiserver-etcd-client.key</font>

<font style="color:#595959;"> </font>

<font style="color:#595959;">解决方案：把这个命令复制到主节点运行即可</font>

<font style="color:#595959;">kubectl -n kubesphere-monitoring-system create secret generic kube-etcd-client-certs --from-file=etcd-client-ca.crt=/etc/kubernetes/pki/etcd/ca.crt --from-file=etcd-client.crt=/etc/kubernetes/pki/apiserver-etcd-client.crt --from-file=etcd-client.key=/etc/kubernetes/pki/apiserver-etcd-client.key</font>

<font style="color:#595959;"> </font>

![1605144986200-6da67b3a-5a33-4b0f-8396-6fdd5d1efa5a.png](./img/4797OHnNvQQn9KN2/1605144986200-6da67b3a-5a33-4b0f-8396-6fdd5d1efa5a-186694.png)

<font style="color:#595959;">表示这个</font><font style="color:#595959;">secret</font><font style="color:#595959;">已经创建了</font>

<font style="color:#595959;">可以用命令查看是否创建成功：</font>

<font style="color:#595959;">kubectl get secret -A          //</font><font style="color:#595959;">这个命令的意思就是获取所有系统里面的</font><font style="color:#595959;">secret</font>

![1605144986324-047f7f8a-a75e-455a-bce9-28af779c9eff.png](./img/4797OHnNvQQn9KN2/1605144986324-047f7f8a-a75e-455a-bce9-28af779c9eff-556691.png)

<font style="color:#595959;"> </font>

<font style="color:#595959;"> </font>

<font style="color:#595959;">只要证书一创建，那么我们这个</font><font style="color:#595959;">prometheus</font><font style="color:#595959;">很快就可以了</font>

![1605144986634-c91844a5-c0d7-47d9-8c6e-e6a4a763e548.png](./img/4797OHnNvQQn9KN2/1605144986634-c91844a5-c0d7-47d9-8c6e-e6a4a763e548-836957.png)

<font style="color:#595959;"> </font>

<font style="color:#595959;">如果还是不行，把这个 prometheus-k8s-0这个</font><font style="color:#595959;">pod</font><font style="color:#595959;">删掉</font>

<font style="color:#595959;">命令：</font><font style="color:#595959;">kubectl delete pod prometheus-k8s-0 -n kubesphere-monitoring-system</font>

<font style="color:#595959;">然后让它再拉取一个就可以了</font>

<font style="color:#595959;"> </font>

<font style="color:#595959;">再把 prometheus-k8s-1这个</font><font style="color:#595959;">pod</font><font style="color:#595959;">删掉，也让它重新拉取</font>

<font style="color:#595959;">命令：</font><font style="color:#595959;">kubectl delete pod prometheus-k8s-1 -n kubesphere-monitoring-system</font>

<font style="color:#595959;"> </font>

<font style="color:#595959;">那么此时，我们可以看到</font>kubesphere的全部已经搞好了，监控也正常了。

![1605144986756-4626a6c2-0e43-4146-a174-5f7c0cc7818d.png](./img/4797OHnNvQQn9KN2/1605144986756-4626a6c2-0e43-4146-a174-5f7c0cc7818d-862694.png)

![1605144986892-da3ec4fa-874e-40a2-84d9-dcc68c079edd.png](./img/4797OHnNvQQn9KN2/1605144986892-da3ec4fa-874e-40a2-84d9-dcc68c079edd-461123.png)

<font style="color:#595959;">、</font>

<font style="color:#595959;"> </font>

<font style="color:#595959;"> </font>

 

 

 



> 更新: 2023-03-29 22:26:26  
> 原文: <https://www.yuque.com/leifengyang/kubesphere/hxzk3t>