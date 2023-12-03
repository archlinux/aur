#!/bin/sh

KERNEL_CONFIGURATION_PATH="/etc/kernel-riot-api/kernel-thorntail.json"
source /etc/kernel-riot-api/config.sh

java -D"swarm.http.port=$KERNEL_CONFIGURATION_PORT" -D"java.net.preferIPv4Stack=true" -D"java.net.preferIPv6Stack=true" -D"java.awt.headless=true" -jar /usr/lib/kernel-riot-api/kernel-thorntail.jar
