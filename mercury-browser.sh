#!/bin/bash

# Copyright (c) 2024 The Chromium Authors, Mozilla, and Alex313031. All rights reserved.
# Use of this source code is governed by a license that can be found in the LICENSE file.

# Let the wrapped binary know that it has been run through the wrapper.
export MERCURY_WRAPPER="`readlink -f "$0"`"

HERE="`dirname "$MERCURY_WRAPPER"`"

# APPNAME for GTK.
APPNAME=mercury

# Set XDG Title variable
TITLE="Mercury"

usage () {
  echo "mercury-browser [-h|--help] [--temp-profile] [options] [URL]"
  echo
  echo "        -h or --help               This help screen"
  echo "        --temp-profile             Start with a new and temporary profile"
  echo "        --mcp                      EXPERIMENTAL: start with the Remote Agent (WebDriver BiDi)"
  echo "                                   on 127.0.0.1 so a local MCP server can drive the browser."
  echo "                                   Uses a separate automation profile. Off unless given."
  echo "        --mcp-port <port>          Remote Agent port for --mcp (default 0 = random free port)"
  echo "        --mcp-profile <dir>        Automation profile for --mcp"
  echo "                                   (default \$XDG_DATA_HOME/mercury-mcp/profile)"
  echo "        --mcp-headless             Run the --mcp browser headless"
  echo
  echo " Other supported options are:"
  MANWIDTH=80 man mercury-browser | sed -e '1,/OPTIONS/d; /ENVIRONMENT/,$d'
  echo " See 'man mercury-browser' for more details"
}

want_temp_profile=0
want_mcp=0
mcp_port=0
mcp_profile=""
mcp_headless=0

while [ $# -gt 0 ]; do
  case "$1" in
    -h | --help | -help )
      usage
      exit 0 ;;
    --temp-profile )
      want_temp_profile=1
      shift ;;
    --mcp )
      want_mcp=1
      shift ;;
    --mcp-port )
      [ $# -ge 2 ] || { echo "mercury-browser: --mcp-port needs a value" >&2; exit 2; }
      mcp_port="$2"
      shift 2 ;;
    --mcp-profile )
      [ $# -ge 2 ] || { echo "mercury-browser: --mcp-profile needs a value" >&2; exit 2; }
      mcp_profile="$2"
      shift 2 ;;
    --mcp-headless )
      mcp_headless=1
      shift ;;
    -- ) # Stop option prcessing
      shift
      break ;;
    * )
      break ;;
  esac
done

# Allow users to override command-line options with a file.
# The file is split on whitespace into an array, so its contents are never
# glob-expanded or re-split later on.
MERCURY_USER_FLAGS=()
if [[ -f ${XDG_CONFIG_HOME:-$HOME/.config}/mercury/mercury-flags.conf ]]; then
   read -r -a MERCURY_USER_FLAGS < <(tr '\n' ' ' < "${XDG_CONFIG_HOME:-$HOME/.config}/mercury/mercury-flags.conf")
elif [[ -f ~/.mercury/mercury-flags.conf ]]; then
   read -r -a MERCURY_USER_FLAGS < <(tr '\n' ' ' < ~/.mercury/mercury-flags.conf)
fi

# Browser binary. MERCURY_BIN is only meant for testing the wrapper.
MERCURY_BIN="${MERCURY_BIN:-/opt/mercury/mercury}"

# EXPERIMENTAL MCP control (see mcp/README.md in the Mercury repo).
# Nothing here runs unless --mcp is passed: without it the browser is started
# exactly as before. With it, Firefox's own built-in Remote Agent is started
# via its standard command-line flags; Mercury adds no browser code for this.
if [ $want_mcp -eq 1 ] ; then
  case "$mcp_port" in
    ''|*[!0-9]*) echo "mercury-browser: --mcp-port must be a number" >&2; exit 2 ;;
  esac
  if [ -z "$mcp_profile" ] ; then
    mcp_profile="${XDG_DATA_HOME:-$HOME/.local/share}/mercury-mcp/profile"
  fi
  # The profile holds WebDriverBiDiServer.json (the port), so keep it private.
  mkdir -p "$mcp_profile" && chmod 700 "$mcp_profile" || exit 1
  MCP_FLAGS=(
    --no-remote
    --profile "$mcp_profile"
    # Remote Agent: always bound to localhost by Firefox. Port 0 = random.
    --remote-debugging-port "$mcp_port"
    # Only accept loopback Host headers (defeats DNS rebinding).
    --remote-allow-hosts "localhost,127.0.0.1"
    # No --remote-allow-origins: any request with an Origin header (i.e. any
    # web page) is refused by the Remote Agent.
  )
  if [ $mcp_headless -eq 1 ] ; then
    MCP_FLAGS+=(--headless)
  fi
  echo "Mercury MCP: Remote Agent on 127.0.0.1 (port ${mcp_port}; 0 = random)." >&2
  echo "Mercury MCP: automation profile: $mcp_profile" >&2
  echo "Mercury MCP: anyone on this machine can control this browser while it runs." >&2
  exec "$MERCURY_BIN" "${MCP_FLAGS[@]}" "${MERCURY_USER_FLAGS[@]}" "$@"
fi

# Launch executable
if [ $want_temp_profile -eq 1 ] ; then
  TEMP_PROFILE="$(mktemp -d)" &&
  echo "Note: Using temporary profile: $TEMP_PROFILE"
  "$MERCURY_BIN" --profile "$TEMP_PROFILE" "${MERCURY_USER_FLAGS[@]}" "$@"
fi

if [ $want_temp_profile -eq 0 ] ; then
  "$MERCURY_BIN" "${MERCURY_USER_FLAGS[@]}" "$@"
fi
