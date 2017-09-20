#!/bin/bash

cat<<-EOF

-----------------------------------------
Unofficial PlayOnLinux5 Launcher
-----------------------------------------

EOF

POL_HOME=/opt/playonlinux5
CLASSPATH=${CLASSPATH}:$POL_HOME/lib/*

# Test for active java
_openjdk=$(ls -d /usr/lib/jvm/java-{8,9}-openjdk* 2>/dev/null | head -1)
_oraclejdk=$(ls -d /usr/lib/jvm/java-{8,9}-jdk* 2>/dev/null | head -1)
_opendjdk_jetbrains=$(ls -d /usr/lib/jvm/java-{8,9}-openjdk-jetbrains* 2>/dev/null | head -1)

# Allow either openjdk java or Oracle java to be used

if (( $(archlinux-java get | cut -d "-" -f2) < 8 )); then

	echo "WARNING: A JVM of version 8 or higher was not found"
	java_default=$(archlinux-java get)
	echo -e "\t==> Picked up default Java of: $java_default"
	echo -e "\t==> Assessing if we have java version 8 or higher..."

	if [[ "$_oraclejdk" ]]; then
		echo -e "\t==> Picked up compatible JVM: $_oraclejdk"
		JAVA_HOME=$_oraclejdk

	elif [[ "$_openjdk_jetbrains" ]]; then
		echo -e "\t==> Picked up compatible JVM: $opendjdk_jetbrains"
		JAVA_HOME=$_openjdk_jetbrains

	elif [[ "$_openjdk" ]]; then
		echo -e "\t==> Picked up compatible JVM: $_openjdk"
		JAVA_HOME=$_opendjdk

	else
		echo -e "\t==> Failed to find a compatible runtime JVM!"

	fi

else

	echo "Running compatible JVM already (default set): $(archlinux-java get)"
	echo "Using: $(archlinux-java get)"
	export JAVA_HOME="/usr/lib/jvm/default"

fi

# JavaFX
# Test for JavaFX (required)

JAVA_FX=$(find $JAVA_HOME/ -name "javafx.properties")
if [[ -n "$JAVA_FX" ]]; then
	JAVA_FX_BOOLEAN="True"
else
	JAVA_FX_BOOLEAN="False"
fi

echo "JavaFX Capabale? $JAVA_FX_BOOLEAN"

if [[ "$JAVA_FX_BOOLEAN" = "False" ]]; then
	echo "Forcing proper Java (if available)"

	if [[ "${_openjdk}" ]]; then
		export JAVA_HOME="${_openjdk[0]}"
		echo "Switching to OpenJDK"

	elif [[ "${_oraclejdk}" ]]; then
		export JAVA_HOME=$(ls /usr/lib/jvm/java-{8,9}-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)
		msg2 "Switching to Oracle JDK"
	else
		msg2 "ERROR: Could not find a proper java build environment. Exiting"
		exit 1
	fi

fi

echo "JAVA_HOME: $JAVA_HOME"

# Start PlayOnLinux
echo "Launching PlayOnLinux5"
$JAVA_HOME/bin/java -classpath "$CLASSPATH" org.phoenicis.javafx.JavaFXApplication "$@"
