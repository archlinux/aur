#!/bin/sh
# SPDX-FileCopyrightText: openjai-git contributors
# SPDX-License-Identifier: 0BSD
# Wrapper for the OpenJai bootstrap compiler.
#
# The upstream binary is built for a macOS-oriented layout; this wrapper
# presents a plain `openjai` command and wires in the system-installed runtime
# manifest and Jai standard-library modules so users do not have to pass
# --runtime / -import_dir on every invocation.
#
# Compiler arguments (--runtime, -import_dir) are placed before any user
# arguments, so they remain valid even if the user passes a `-` separator for
# the compile-time metaprogram.
exec /usr/lib/openjai/openjai \
    --runtime /usr/lib/openjai/openjai_runtime.manifest \
    -import_dir /usr/share/openjai/modules \
    "$@"
