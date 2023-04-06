#!/usr/bin/env bash
# Author: James Cherti
# URL: https://github.com/jamescherti/archlinux-linux-keep-modules
# License: Distributed under terms of the MIT license.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

set -euf -o pipefail

log() {
  echo "[pacman-hook-linux-modules]" "$@"
}

#
# Backup the modules of the currently running Linux kernel.
#
backup_linux_modules() {
  if ! [[ -d "$BACKUP_MODULES_SRC" ]]; then
    log "[INFO] There is nothing to backup."
    return 0
  fi

  log "[UPDATE BACKUP] $BACKUP_MODULES_SRC/ -> $BACKUP_MODULES_DEST/"
  mkdir -p "$BACKUP_MODULES_DEST" || return 1
  rsync "${RSYNC_OPTS[@]}" \
    "$BACKUP_MODULES_SRC/" "$BACKUP_MODULES_DEST/" || return 1
}

#
# Restore the modules of the currently running Linux kernel.
#
restore_linux_modules() {
  if ! [[ -d "$BACKUP_MODULES_DEST" ]]; then
    log "[INFO] There is nothing to restore."
    return 0
  fi

  if [[ -d "$BACKUP_MODULES_SRC" ]]; then
    # Backup the kernel modules again because the package upgrade may have
    # modified them.
    backup_linux_modules || return 1
  fi

  log "[RESTORE] ${BACKUP_MODULES_DEST}/ -> ${BACKUP_MODULES_SRC}/"
  rsync "${RSYNC_OPTS[@]}" \
    "$BACKUP_MODULES_DEST/" "${BACKUP_MODULES_SRC}/" || return 1
}

#
# Delete the kernel modules that are neither owned by an Arch Linux package
# nor used by the currently running Linux kernel.
#
cleanup_linux_modules() {
  local errno=0
  local cleanup_done=0
  local list_modules

  readarray -t list_modules < <(ls --almost-all -1 "${MODULES_BASE_DIR}")
  if [[ ${#list_modules[@]} -eq 0 ]]; then
    echo "Nothing to do."
    return 0
  fi

  local cur_kernel_ver
  for cur_kernel_ver in "${list_modules[@]}"; do
    local cur_backup_modules_src="${MODULES_BASE_DIR}/${cur_kernel_ver}"

    if [[ -d "$cur_backup_modules_src" ]] && \
          [[ "$KERNEL_VER" != "$cur_kernel_ver" ]] && \
          ! pacman -Qo "$cur_backup_modules_src" >/dev/null 2>&1; then
      local sub_fileordir
      local sub_fileordir_found=0
      if [[ "$cur_kernel_ver" = "$BACKUP_SUBDIR_NAME" ]]; then
        sub_fileordir_found=1
      fi

      for sub_fileordir in build extramodules kernel pkgbase vmlinuz; do
        if [[ -e "$cur_backup_modules_src/$sub_fileordir" ]]; then
          sub_fileordir_found=1
          break
        fi
      done

      if [[ $sub_fileordir_found -eq 0 ]]; then
        log "[IGNORE] $cur_backup_modules_src"
      else
        log "[DELETE] $cur_backup_modules_src"
        rm -fr "$cur_backup_modules_src" || errno=1
        cleanup_done=1
      fi
    fi
  done

  if [[ $cleanup_done -eq 0 ]]; then
    echo "Nothing to do."
  fi

  return "$errno"
}

print_usage() {
  echo "Usage: $0 <backup|restore|cleanup>"
}

main() {
  RSYNC_OPTS=(-a --xattrs --hard-links --acls --sparse)
  KERNEL_VER="$(uname -r)"
  MODULES_BASE_DIR="/usr/lib/modules"
  BACKUP_SUBDIR_NAME="pacman-hook-backup"
  BACKUP_MODULES_SRC="${MODULES_BASE_DIR}/${KERNEL_VER}"
  BACKUP_MODULES_DEST="${MODULES_BASE_DIR}/${BACKUP_SUBDIR_NAME}/${KERNEL_VER}"

  if [[ "$KERNEL_VER" = "" ]]; then
    echo "Error: invalid value returned by the command 'uname -r'." >&2
    exit 1
  fi

  if [[ "$#" -eq 0 ]]; then
    print_usage
    exit 1
  fi

  if [[ "$1" = "backup" ]]; then
    # Backup the kernel modules before upgrading the packages.
    backup_linux_modules || exit 1
  elif [[ "$1" = "restore" ]]; then
    # Restore the kernel modules after upgrading the packages.
    restore_linux_modules || exit 1
  elif [[ "$1" = "cleanup" ]]; then
    cleanup_linux_modules || exit 1
  else
    print_usage
    exit 1
  fi

  exit 0
}

main "$@"
