# Location of WildFly
export JBOSS_HOME=/opt/wildfly

# Application server mode (standalone/domain)
export JBOSS_MODE=standalone

# Configuration for standalone mode
export JBOSS_CONFIG=standalone.xml

# Configuration for domain mode
export JBOSS_DOMAIN_CONFIG=domain.xml
export JBOSS_HOST_CONFIG=host-master.xml

# The username who should own the process.
export JBOSS_USER=wildfly

# PID file
export JBOSS_PIDFILE=/run/wildfly/wildfly.pid

# Location to keep the console log
export JBOSS_CONSOLE_LOG=/var/log/wildfly/console.log
