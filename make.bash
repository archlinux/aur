#!/usr/bin/env bash
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
makepkg --printsrcinfo > "${SCRIPT_PATH}/.SRCINFO"
makepkg --clean --cleanbuild --dir "${SCRIPT_PATH}" --force --install --rmdeps
