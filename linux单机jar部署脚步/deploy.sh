#!/bin/bash
JAVA_OPTIONS="-Xmx512m -Xms126m -XX:+HeapDumpOnOutOfMemoryError "
JARPATH=`pwd`
JARNAMEWITHOUTVERSION=''
declare -a JARNAME



function findJAR()
{
  JARNAME=($(ls -l $JARPATH | grep \\.jar$ | awk '{print $NF}'))
  if [[ ${#JARNAME[@]} > 1 ]]
  then
    echo "[${JARNAME[@]}] too many jar files!!! I don't know startup which one."
    exit 1
  elif [[ ${#JARNAME[@]} == 0 ]]
  then
    echo "this is no jar file in $JARPATH"
    exit 1
  else
    version=`echo "${JARNAME[0]}" | grep -E '\-[0-9][\.0-9]+[-0-9a-zA-Z]*\.jar$' -o`
    # echo "version=${version}"
    JARNAMEWITHOUTVERSION=${JARNAME[0]/${version}/}
    # echo "JARNAMEWITHOUTVERSION=${JARNAMEWITHOUTVERSION}"
  fi
}

function start()
{
  findJAR
  # 根据服务名称来获取process id
  local server_pid=`ps -ef | grep java | grep " ${JARNAMEWITHOUTVERSION}" | awk '{print $2}'`
  if [ "${server_pid}" != "" ]
  then
     echo -e "${JARNAMEWITHOUTVERSION} is alived with pid ${server_pid}.\nabort start action"
     exit 1
  fi
  if [[ -f "${CONFIGFILE}" ]]
  then
     nohup java ${JAVA_OPTIONS} -jar ${JARNAME[0]} > /dev/null 2>&1 &
  else
     nohup java ${JAVA_OPTIONS} ${EXTEND_JAVA_OPTIONS} -jar ${JARNAME[0]}  > /dev/null 2>&1 &
  fi
  server_pid=`ps -ef | grep java | grep " ${JARNAME[0]}" | awk '{print $2}'`
  echo "${JARNAME[0]} is alived with pid ${server_pid}."
  return 0
}

echo '------------------------start-------------------'
#启动状态返回0 停止状态返回1
function status()
{
  findJAR
  local server_pid=`ps -ef | grep java | grep " ${JARNAMEWITHOUTVERSION}" | awk '{print $2}'`
  if [ "${server_pid}" != "" ]
  then
     echo -e "${JARNAME[0]} is alived with pid ${server_pid}."
     return 0
  else
     echo "${JARNAME[0]} isn't alived."
     return 1
  fi
}
echo '------------------------status-------------------'
function stop()
{
  findJAR
  local server_pid=`ps -ef | grep java | grep " ${JARNAMEWITHOUTVERSION}" | awk '{print $2}'`
  if [ "$server_pid" != "" ]
  then
     echo "${JARNAMEWITHOUTVERSION} is alived with pid ${server_pid}."
     kill -9 $server_pid
     echo "has stopped ${JARNAME[0]}"
     return 0
  else
     echo "${JARNAME[0]} isn't alived."
     return 1
  fi
}

echo '------------------------stop-------------------'

case "$1" in
   "start")
     start
   ;;
   "stop")
     stop
   ;;
   "restart")
     stop
     sleep 1
     start
   ;;
   "status")
     status
   ;;
   "rename")
     rename
   ;;
   "restore")
     restore
   ;;
   "renameconfig")
     renameConfig
   ;;
   "restoreconfig")
     restoreConfig
   ;;
   "uncompress")
     unzipServer
   ;;
   "initnacos")
      initNacos $*
   ;;
   "checkport")
      checkport $*
   ;;
   "modifyProps")
      confProps $*
   ;;
   *)
     usage
   ;;
  esac
