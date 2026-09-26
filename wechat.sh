#!/usr/bin/env bash
#
# Launcher script for tencent-wechat
# Provides native Wayland auto-detection, Fcitx5 text-input-v3 support,
# chat data preservation, desktop portal URL forwarding, and a lightweight privacy sandbox using bubblewrap.
#

set -e

WECHAT_BIN="/opt/wechat/wechat"

# 1. Environment & Platform Auto-detection
if [[ -n "${WAYLAND_DISPLAY}" && -S "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}" ]]; then
    export QT_QPA_PLATFORM="wayland;xcb"
    # Enable native Wayland text-input-v3 for proper IME candidate popup placement
    export QT_IM_MODULE="text-input-unstable-v3"
    unset QT_IM_MODULES GTK_IM_MODULE
else
    export QT_QPA_PLATFORM="xcb"
fi

# 2. Chat Data Protection & Global Symlink Integrity
# If user has an existing active data store in WeChat_Data, ensure standard links point to it
REAL_DATA_DIR="${HOME}/Documents/WeChat_Data/xwechat_files"
DOC_LINK="${HOME}/Documents/xwechat_files"
HOME_LINK="${HOME}/xwechat_files"

if [[ -d "${REAL_DATA_DIR}" ]]; then
    if [[ ! -L "${DOC_LINK}" ]] && [[ ! -e "${DOC_LINK}" ]]; then
        ln -sf "${REAL_DATA_DIR}" "${DOC_LINK}"
    fi
    if [[ ! -L "${HOME_LINK}" ]] && [[ ! -e "${HOME_LINK}" ]]; then
        ln -sf "${REAL_DATA_DIR}" "${HOME_LINK}"
    fi
fi

# 3. Privacy Sandbox via Bubblewrap (if installed)
# - Direct host $HOME mapping ensures drag-and-drop file sending works seamlessly
# - Mask ~/.ssh and ~/.gnupg with empty tmpfs to protect user keys from proprietary software
# - Pass through GPU (/dev/dri) and Audio (/dev/snd) for hardware acceleration and calls
# - Forward web links and files to host browser/apps via XDG Desktop Portal (fixes duplicate browser and profile errors)
# - Isolated PID namespace and read-only system root
if command -v bwrap >/dev/null 2>&1; then
    PORTAL_OPEN_WRAPPER="${XDG_RUNTIME_DIR}/wechat-xdg-open"
    cat << 'EOF' > "${PORTAL_OPEN_WRAPPER}"
#!/usr/bin/env bash
target=""
for arg in "$@"; do
    if [[ "$arg" != -* ]]; then
        target="$arg"
        break
    fi
done

if [[ -n "${target}" ]]; then
    if [[ "${target}" =~ ^www\. ]]; then
        target="http://${target}"
    fi

    if [[ "${target}" =~ ^[a-zA-Z][a-zA-Z0-9+.-]*:// && ! "${target}" =~ ^file:// ]]; then
        exec gdbus call --session \
            --dest org.freedesktop.portal.Desktop \
            --object-path /org/freedesktop/portal/desktop \
            --method org.freedesktop.portal.OpenURI.OpenURI \
            --timeout 5 \
            "" "${target}" "{}" >/dev/null 2>&1
    fi

    file_path="${target#file://}"
    if [[ -d "${file_path}" ]]; then
        exec gdbus call --session \
            --dest org.freedesktop.portal.Desktop \
            --object-path /org/freedesktop/portal/desktop \
            --method org.freedesktop.portal.OpenURI.OpenDirectory \
            --timeout 5 \
            "" "3" "{}" 3< "${file_path}" >/dev/null 2>&1
    elif [[ -e "${file_path}" ]]; then
        exec gdbus call --session \
            --dest org.freedesktop.portal.Desktop \
            --object-path /org/freedesktop/portal/desktop \
            --method org.freedesktop.portal.OpenURI.OpenFile \
            --timeout 5 \
            "" "3" "{}" 3< "${file_path}" >/dev/null 2>&1
    fi
fi
exit 0
EOF
    chmod 755 "${PORTAL_OPEN_WRAPPER}"

    BWRAP_ARGS=(
        --ro-bind / /
        --dev /dev
        --dev-bind-try /dev/dri /dev/dri
        --dev-bind-try /dev/snd /dev/snd
        --tmpfs /dev/shm
        --proc /proc
        --ro-bind-try /sys /sys
        --tmpfs /tmp
        --bind-try /tmp/.X11-unix /tmp/.X11-unix
        --bind /run /run
        --bind "${HOME}" "${HOME}"
        --tmpfs "${HOME}/.ssh"
        --tmpfs "${HOME}/.gnupg"
        --ro-bind "${PORTAL_OPEN_WRAPPER}" /usr/bin/xdg-open
        --unshare-pid
    )
    for dev_node in /dev/video*; do
        [[ -e "$dev_node" ]] && BWRAP_ARGS+=(--dev-bind "$dev_node" "$dev_node")
    done

    exec bwrap "${BWRAP_ARGS[@]}" "${WECHAT_BIN}" "$@"
else
    exec "${WECHAT_BIN}" "$@"
fi
