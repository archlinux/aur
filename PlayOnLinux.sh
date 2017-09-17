#!/bin/bash

POL_HOME=/opt/playonlinux5
CLASSPATH=${CLASSPATH}:$POL_HOME/lib/*

# Allow either openjdk java or Oracle java to be used

if (( $(archlinux-java get | cut -d "-" -f2) < 8 )); then

	echo "WARNING: A JVM of version 8 or higher was not found"
	java_default=$(archlinux-java get)
	echo -e "\t==> Picked up default Java of: $java_default"
	echo -e "\t==> Assessing if we have JetBrains or OpenJDK with version 8 or higher..."

	# Order is Oracle/Jetbrains/OpenJDK
	# If you have both Oracle/Jetbrains, choose one.
	# It is too diffcult to appease everyone...
	javaver_oracle=$(ls -d /usr/lib/jvm/java-{8,9}-jdk* 2>/dev/null | head -1)
	javaver_openjdk=$(ls -d /usr/lib/jvm/java-{8,9}-openjdk* 2>/dev/null | head -1)
	javaver_jetbrains=$(ls -d /usr/lib/jvm/java-{8,9}-openjdk-jetbrains* 2>/dev/null | head -1)

	if [[ "$javaver_oracle" ]]; then
		echo -e "\t==> Picked up compatible JVM: $javaver_oracle"
		javaver=$javaver_oracle
	elif [[ "$javaver_jetbrains" ]]; then
		echo -e "\t==> Picked up compatible JVM: $javaver_jetbrains"
		javaver=$javaver_jetbrains
	elif [[ "$javaver_openjdk" ]]; then
		echo -e "\t==> Picked up compatible JVM: $javaver_openjdk"
		javaver=$javaver_opendjdk
	else
		echo -e "\t==> Failed to find a compatible runtime JVM!"
	fi

else

	echo "Running compatible JVM already (default set): $(archlinux-java get)"

fi

# Start PlayOnLinux
$javaver/bin/java -classpath "$CLASSPATH" org.phoenicis.javafx.JavaFXApplication "$@"
