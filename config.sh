
# this file is sourced by
#   1.install.cluster.sh
#   2.install.certificate.sh
#   3.start.cluster.sh
#   5.delete.cluster.sh


ORIGIN_HOME=/var/lib/origin
PUBLIC_HOSTNAME=$(hostname)
ROUTING_SUFFIX=apps.$(hostname)
ADMIN_USERNAME=$(whoami)

#CERT_FILE=/path-to/$(hostname)/certificate
#KEY_FILE=/path-to/$(hostname)/private-key
