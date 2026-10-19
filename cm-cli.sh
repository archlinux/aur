#!/bin/bash
# cm-cli launcher
# Installed by the comfyui-manager package.
#
# Runs the cm-cli entry point from the ComfyUI venv that the comfyui package
# sets up. cm-cli needs to run in the same Python environment as ComfyUI and
# requires COMFYUI_PATH to point at the ComfyUI installation.
#
# It also changes into the install prefix first: the manager drives pip via
# uv, which searches the current directory and its parents for uv.toml, so a
# call such as "sudo -u comfy cm-cli ..." from a directory the service user
# cannot read would fail with "Permission denied".

_prefix=$(sed -n 's/^_prefix="\(.*\)"$/\1/p' /usr/bin/comfyui 2>/dev/null | head -n1)
_prefix="${_prefix:-/opt/comfyui}"

if [ ! -x "$_prefix/venv/bin/cm-cli" ]; then
    echo "Error: cm-cli not found in $_prefix/venv" >&2
    echo "The comfyui-manager post-install setup may have failed." >&2
    echo "Try reinstalling: sudo pacman -S comfyui-manager" >&2
    exit 1
fi

export COMFYUI_PATH="${COMFYUI_PATH:-$_prefix}"
cd "$_prefix" || exit 1
exec "$_prefix/venv/bin/cm-cli" "$@"
