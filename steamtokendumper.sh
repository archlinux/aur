#!/usr/bin/sh
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-FileType: SOURCE
#
# SPDX-FileCopyrightText: 2024 Frederik “Freso” S. Olesen <https://freso.dk/>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

INSTALL_DIR=/opt/steamtokendumper
CONFIG_DIR="${XDG_CONFIG_HOME:=$HOME/.config}"/SteamTokenDumper
RUN_DIR="$XDG_RUNTIME_DIR"/SteamTokenDumper
EXEC_DIR="$INSTALL_DIR"

unionfs_exists() {
  unionfs --version > /dev/null 2>&1
  return $?
}

unionfs_setup() {
  echo "Setting up UnionFS user writable directory '$CONFIG_DIR'."

  # Directories potentially containing Steam login cookie
  # should not be world readable, but we don’t care about
  # parent directories’ permissions.
  # shellcheck disable=SC2174
  mkdir -p -m700 "$CONFIG_DIR" "$RUN_DIR"

  unionfs -o cow,relaxed_permissions "$CONFIG_DIR=RW:$INSTALL_DIR=RO" "$RUN_DIR"

  export EXEC_DIR="$RUN_DIR"
}

unionfs_cleanup() {
  if test -e "$RUN_DIR"; then
    echo
    echo "Cleaning up '$RUN_DIR'…"
    fusermount -uzq "$RUN_DIR" > /dev/null 2>&1
    rmdir "$RUN_DIR" > /dev/null 2>&1
  fi
}

trap unionfs_cleanup INT

if unionfs_exists; then
  unionfs_setup
  echo "Running SteamTokenDumper from '$EXEC_DIR'."
else
  echo "UnionFS not detected; running without user writable directory."
fi

"$EXEC_DIR"/SteamTokenDumper
_exit_code=$?

unionfs_cleanup

exit $_exit_code
