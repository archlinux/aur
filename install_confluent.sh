user_list="cp-control-center cp-kafka-connect cp-kafka-rest cp-kafka cp-ksql cp-schema-registry cp-install_kafka"
group=confluent

ensure_directories() {
	# Configure Apache kafka 
	for dir in /var/log/confluent/kafka /var/lib/confluent/kafka /var/lib/confluent/zookeeper /var/log/kafka; do
		install -g confluent -o cp-kafka -m 0755 -d ${pkgdir}/$dir
	done

	# Required directories for Confluent Control Center 
	for dir in /var/log/confluent/control-center /var/lib/confluent/control-center /usr/share/confluent-control-center; do
		install -g confluent -o cp-control-center -m 0755 -d ${pkgdir}/$dir
	done

	# Required directories for Confluent Schema Registry
	for dir in /var/log/confluent/schema-registry; do
		install -g confluent -o cp-schema-registry -m 0755 -d ${pkgdir}/$dir
	done
}

post_install() {
	systemd-sysusers confluent.conf
	ensure_directories
}

post_upgrade(){
	systemd-sysusers confluent.conf
	ensure_directories
}

post_remove() {
	for usr in `echo $user_list`; do
		if getent passwd $usr >/dev/null 2>&1; then
			userdel -f $usr
		fi
	done

	groupdel $group
}
