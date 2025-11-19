export HADOOP_COMMON_LIB_NATIVE_DIR=/usr/lib
export HADOOP_CONF_DIR=/etc/hadoop
export HADOOP_LOG_DIR=/var/log/hadoop
export HADOOP_USERNAME=hadoop

# Consistently use "hadoop" even when running as root or other user
# Make it behave like daemons and prevent creating wrong DFS path (username based)
export HDFS_NAMENODE_USER=hadoop
export HDFS_DATANODE_USER=hadoop
export HDFS_SECONDARYNAMENODE_USER=hadoop
export YARN_NODEMANAGER_USER=hadoop
export YARN_RESOURCEMANAGER_USER=hadoop

export JAVA_HOME=/usr/lib/jvm/default
