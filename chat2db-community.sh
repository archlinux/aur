#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/bin/@runname@"

# Base environment variables
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Use bundled JRE
_JAVADIR="${_APPDIR}/runtime"
export PATH="${_JAVADIR}/bin:${PATH}"

# Build classpath from all JAR files
CLASSPATH=""
for jar in "${_APPDIR}/app/"*.jar; do
    if [[ -f "$jar" ]]; then
        if [[ -z "$CLASSPATH" ]]; then
            CLASSPATH="$jar"
        else
            CLASSPATH="${CLASSPATH}:${jar}"
        fi
    fi
done

# Add lib directory JARs to classpath
for jar in "${_APPDIR}/"*.jar; do
    if [[ -f "$jar" ]]; then
        CLASSPATH="${CLASSPATH}:${jar}"
    fi
done

cd "${_APPDIR}"

# Read Java options from cfg file
_CFG_FILE="${_APPDIR}/app/Chat2DB Community.cfg"
declare -a java_opts
if [[ -f "${_CFG_FILE}" ]]; then
    while IFS= read -r line; do
        if [[ "${line}" == java-options=* ]]; then
            java_opts+=("${line#java-options=}")
        fi
    done < <(sed -n '/^\[JavaOptions\]/,/^\[/p' "${_CFG_FILE}")
fi

# Execute Java application
exec java \
    "${java_opts[@]}" \
    -cp "${CLASSPATH}" \
    org.springframework.boot.loader.launch.PropertiesLauncher \
    "$@"