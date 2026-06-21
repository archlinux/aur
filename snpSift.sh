#!/usr/bin/sh
# Find a suitable Java runtime (requires Java >= 21)
if [ -n "$JAVA_HOME" ] && [ -x "$JAVA_HOME/bin/java" ]; then
    JAVA_EXEC="$JAVA_HOME/bin/java"
else
    JAVA_EXEC="/usr/bin/java"
    # If the default java is not >= 21, try to find one under /usr/lib/jvm/
    if [ -x "$JAVA_EXEC" ]; then
        DEFAULT_VER=$("$JAVA_EXEC" -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d. -f1)
        if [ -z "$DEFAULT_VER" ] || [ "$DEFAULT_VER" -lt 21 ]; then
            for jvm in /usr/lib/jvm/java-*-openjdk /usr/lib/jvm/java-*; do
                if [ -x "$jvm/bin/java" ]; then
                    JVM_VER=$(basename "$jvm" | sed -E 's/java-([0-9]+)-.*/\1/')
                    case "$JVM_VER" in
                        [0-9]*)
                            if [ "$JVM_VER" -ge 21 ]; then
                                JAVA_EXEC="$jvm/bin/java"
                                break
                            fi
                            ;;
                    esac
                fi
            done
        fi
    fi
fi

exec "$JAVA_EXEC" -jar '/usr/share/java/snpEff/snpSift.jar' "${@}"