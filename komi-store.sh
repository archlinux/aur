#!/usr/bin/env bash
set -eo pipefail
APPDIR="/usr/lib/@appname@"
RUNNAME="${APPDIR}/bin/@runname@"
RUNTIME="${APPDIR}/lib/runtime"
JAVA="${RUNTIME}/bin/java"
APPDIR_JARS="${APPDIR}/lib/app"

if [ ! -x "${JAVA}" ]; then
    JAVA="$(command -v java 2>/dev/null || true)"
    if [ -z "${JAVA}" ] || [ ! -x "${JAVA}" ]; then
        echo "komi-store: no java found" >&2
        exit 1
    fi
fi

CFG="$(find "${APPDIR_JARS}" -maxdepth 1 -name '*.cfg' 2>/dev/null | head -n1 || true)"
if [ -z "${CFG}" ] || [ ! -f "${CFG}" ]; then
    echo "komi-store: launcher .cfg not found under ${APPDIR}" >&2
    exit 1
fi

expand() {
    local v="$1"
    v="${v//\$APPDIR/${APPDIR_JARS}}"
    v="${v//\$\{APPDIR\}/${APPDIR_JARS}}"
    v="${v//\$RUNTIME/${RUNTIME}}"
    v="${v//\$\{RUNTIME\}/${RUNTIME}}"
    printf '%s' "$v"
}

classpath=""
modulepath=""
mainclass=""
mainmodule=""
javaopts=()
section=""

while IFS= read -r line || [ -n "$line" ]; do
    line="${line%$'\r'}"
    case "$line" in
        \[*\]) section="$line"; continue ;;
        ''|'#'*) continue ;;
    esac
    case "$section" in
        '[Application]')
        case "$line" in
            app.classpath=*)
            entry="$(expand "${line#app.classpath=}")"
            if [ -z "$classpath" ]; then classpath="$entry"; else classpath="$classpath:$entry"; fi
            ;;
            app.modulepath=*)
            entry="$(expand "${line#app.modulepath=}")"
            if [ -z "$modulepath" ]; then modulepath="$entry"; else modulepath="$modulepath:$entry"; fi
            ;;
            app.mainclass=*)  mainclass="${line#app.mainclass=}" ;;
            app.mainmodule=*) mainmodule="${line#app.mainmodule=}" ;;
        esac
        ;;
        '[JavaOptions]')
        case "$line" in
            java-options=*) javaopts+=("$(expand "${line#java-options=}")") ;;
        esac
        ;;
    esac
done < "$CFG"

cd "${APPDIR_JARS}"

launch_args=("${javaopts[@]}")
if [ -n "$mainmodule" ]; then
    [ -n "$modulepath" ] && launch_args+=(--module-path "$modulepath")
    [ -n "$classpath" ] && launch_args+=(-cp "$classpath")
    launch_args+=(-m "$mainmodule")
    elif [ -n "$classpath" ] && [ -n "$mainclass" ]; then
    launch_args+=(-cp "$classpath" "$mainclass")
    else
    echo "komi-store: could not resolve main class / module from $CFG" >&2
    exit 1
fi

exec "${JAVA}" "${launch_args[@]}" "$@"