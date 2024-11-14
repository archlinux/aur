#!/bin/bash

# 设置默认值
BASE_DIR="/var/lib/reader-pro"
LOG_DIR="/var/log/reader-pro"
CONFIG_DIR="/usr/share/java/reader-pro/conf"
STORAGE_PATH="/var/lib/reader-pro"
JAVA_CMD="$JAVA_HOME/bin/java"
JAVA_OPT=""
MODE=""
INVITE_CODE=""
SECURE_KEY=""
SERVER="reader-pro"
NEWEST_JAR=$(ls /usr/share/java/reader-pro/ | grep -Eo 'reader-pro.*\.jar' | sort -nr | head -1)
if [ -n "$NEWEST_JAR" ]; then
  SERVER=${NEWEST_JAR/.jar/}
fi

# 解析命令行参数
while getopts ":m:s:i:k:" opt; do
  case $opt in
  m) MODE=$OPTARG ;;
  s) SERVER=$OPTARG ;;
  i) INVITE_CODE=$OPTARG ;;
  k) SECURE_KEY=$OPTARG ;;
  ?)
    echo "未知的参数: $opt"
    exit 1
    ;;
  esac
done

# 根据模式设置JVM选项
if [ -z "$MODE" ]; then
  echo "Reader 的运行模式以配置文件 $CONFIG_DIR/application.properties 为准。注意，当前未限制 JVM 内存"
elif [ "$MODE" == "single" ]; then
  JAVA_OPT="${JAVA_OPT} -Xms256m -Xmx256m -Xmn128m -Dreader.app.secure=false"
  echo "Reader 将以单用户模式运行。注意，当前内存限制为 256m"
else
  JAVA_OPT="${JAVA_OPT} -server -Xms1g -Xmx1g -Xmn512m -XX:MetaspaceSize=64m -XX:MaxMetaspaceSize=160m -XX:-OmitStackTraceInFastThrow -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${LOG_DIR}/java_heapdump.hprof -XX:-UseLargePages -Dreader.app.secure=true"
  TIPS=""
  if [ -n "$INVITE_CODE" ]; then
    JAVA_OPT="${JAVA_OPT} -Dreader.app.inviteCode=${INVITE_CODE}"
    TIPS="${TIPS} 邀请码：${INVITE_CODE}"
  fi
  if [ -n "$SECURE_KEY" ]; then
    JAVA_OPT="${JAVA_OPT} -Dreader.app.secureKey=${SECURE_KEY}"
    TIPS="${TIPS} 管理员密码：${SECURE_KEY}"
  fi
  if [ -z "$TIPS" ]; then
    TIPS="邀请码和管理员密码以配置文件 $CONFIG_DIR/application.properties 为准"
  fi
  TIPS="${TIPS}。注意，当前内存限制为 1g"
  echo "Reader 将以多用户模式运行。${TIPS}"
fi

# 添加存储路径到JVM选项
JAVA_OPT="${JAVA_OPT} -Dreader.app.storagePath=${STORAGE_PATH}"

# 确定Java主要版本
JAVA_MAJOR_VERSION=$($JAVA_CMD -version 2>&1 | sed -E -n 's/.* version "([0-9]*).*$/\1/p')
if [ "$JAVA_MAJOR_VERSION" -ge "9" ]; then
  JAVA_OPT="${JAVA_OPT} -Xlog:gc*:file=${LOG_DIR}/reader_gc.log:time,tags:filecount=10,filesize=100m"
else
  JAVA_OPT="${JAVA_OPT} -Xloggc:${LOG_DIR}/reader_gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M"
fi

# 其他JVM选项
JAVA_OPT="${JAVA_OPT} -Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8 -Dreader.app.workDir=${BASE_DIR} -Dspring.config.location=file:${CONFIG_DIR}/application.properties"

# 创建日志目录（如果不存在）
mkdir -p "${LOG_DIR}"

# 记录启动命令
START_LOG_FILE="${LOG_DIR}/start.out"
echo "启动命令：" >"${START_LOG_FILE}"
echo "$JAVA_CMD $JAVA_OPT -jar /usr/share/java/reader-pro/${SERVER}.jar" >>"${START_LOG_FILE}"
echo "" >>"${START_LOG_FILE}"

# 启动应用程序
echo "Reader 正在启动中，你可以在 ${LOG_DIR}/start.out 查看日志" >>"${START_LOG_FILE}"
exec "$JAVA_CMD" $JAVA_OPT -jar /usr/share/java/reader-pro/${SERVER}.jar
