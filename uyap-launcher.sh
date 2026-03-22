#!/bin/bash
export user="$USER"
basedir=/usr/share/UYAPEditor

# Determine mode based on executable name
if [[ "$(basename "$0")" == "uyapsablon" ]]; then
    APP_TYPE="EDITOR_TYPE_TEMPLATE"
    APP_TITLE="UYAP Şablon Editörü"
else
    APP_TYPE="EDITOR_TYPE_DOCUMENT"
    APP_TITLE="UYAP Doküman Editörü"
fi

# Find suitable Java (strictly 11, fallback to 8 for legacy e-signatures)
JAVA_BIN=""
for jvm in /usr/lib/jvm/java-11-*/bin/java /usr/lib/jvm/java-8-*/bin/java; do
    if [ -x "$jvm" ]; then
        JAVA_BIN="$jvm"
        break
    fi
done

if [ -z "$JAVA_BIN" ]; then
    ERR_MSG="A compatible Java Runtime Environment (Java 11 or 8) is required to launch $APP_TITLE, but it could not be located on your system.\n\nPlease install the necessary dependencies by running the following command in your terminal:\n\n    sudo pacman -S jre11-openjdk\n\nOnce the installation is complete, you may relaunch the application."
    echo -e "$ERR_MSG"
    if command -v zenity >/dev/null 2>&1; then
        zenity --error --title="$APP_TITLE - Java Missing" --text="$ERR_MSG"
    elif command -v kdialog >/dev/null 2>&1; then
        kdialog --error "$ERR_MSG" --title="$APP_TITLE - Java Missing"
    elif command -v xmessage >/dev/null 2>&1; then
        xmessage -center "$APP_TITLE: $ERR_MSG"
    fi
    exit 1
fi

# Performance Optimization Flags
# -Xms256m: Pre-allocates 256MB on start to eliminate slow OS memory requesting during launch.
# -Xmx1024m: Allows up to 1GB RAM to prevent Garbage Collector freezing on massive PDF-embedded files.
# -XX:+UseStringDeduplication: Merges massive amounts of duplicate string tags in the editor.
# -Dawt...: Forces Java to utilize system-native anti-aliasing for much sharper, faster UI fonts.
# -Dsun.java2d.opengl=true: Forces hardware-accelerated UI rendering, eliminating tearing and stuttering over rulers/text areas.
JAVA_OPTS=(
    "-Xms256m"
    "-Xmx1024m"
    "-XX:+UseStringDeduplication"
    "-Dawt.useSystemAAFontSettings=on"
    "-Dswing.aatext=true"
)

exec "$JAVA_BIN" "${JAVA_OPTS[@]}" -cp "$basedir/*:$basedir/." tr.com.havelsan.uyap.system.editor.common.WPAppManager "getNewWPInstance" "$APP_TYPE" "$@"
