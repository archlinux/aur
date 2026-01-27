#!/bin/bash

set -e
set -o pipefail

JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-21-openjdk}
NEXUS_MEMORY=${NEXUS_MEMORY:-2703m}

nexus_home=$(cd $(dirname $0)/..; pwd)
nexus_version=@version@-@patch@

nexus_options=$(cat ${nexus_home}/bin/nexus.vmoptions | sed -e 's/#.*//' -e '/^\s*$/d')

set -x
cd ${nexus_home}
exec ${JAVA_HOME}/bin/java -server ${nexus_options} -Xmx${NEXUS_MEMORY} -Xms${NEXUS_MEMORY} -jar bin/sonatype-nexus-repository-${nexus_version}.jar

