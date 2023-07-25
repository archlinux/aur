#!/bin/bash

_timestamp="`date +%Y%m%d_%H%M%S`"
_libdir="/usr/lib/pinesam"
_backenddir="${_libdir}/backend"
_uidir="${_libdir}/ui"
_logdir="/tmp/pinesam/log.${_timestamp}"
_backendlog="${_logdir}/backend_server.log"
_webserverlog="${_logdir}/web_server.log"
_rundir='/tmp/pinesam'
# There is a symlink '/usr/lib/pinesam/ui/node_modules/.vite' which points here. So this should not be changed.
_vite_deps="${_rundir}/.vite"
_default_port=5173

mkdir -p "${_vite_deps}"
chmod 777 "${_vite_deps}"
mkdir -p "${_logdir}"

set -m # Turn on job control

msg() {
  printf '%s\n' "$@"
}

errmsg() {
  msg "$@" > /dev/stderr
}

printusage() {
  local message=(
    "pinesam -- GUI for Bluetooth-enabled (firmware >=2.21) Pineil V2 soldering irons."
    ""
    "Usage:"
    "  $0 [--port <port>] [--host [bind]] [--https] [--cors] [-d] [... other vite options ...]"
    ""
    "Where the (all optional) arguments mean:"
    "  --port <port>:  Listen at port <port> (default: ${_default_port})."
    "  --host:         Listen not only on the loopback interface (127.0.0.1), but also on others,"
    "                  thereby exposing the service to the outside world. Optional 'bind': Listen"
    "                  only at the specified IP adress (may be a hostname that resolves to a local"
    "                  IP adress)."
    "  --https:        Use TLS + HTTP/2."
    "  --cors:         Enable CORS."
    "  -d:             Emit debug messages."
    "  -h|--help|help: Print this help text."
  )
  printf '%s\n' "${message[@]}"
}

_port="${_default_port}"
_vite_options=()
while [ $# -ge 1 ]; do
  case "$1" in
    '-h'|'--help'|'help')
      printusage
      shift
      exit 0
    ;;
    '--port')
      shift
      if [ $# -lt 1 ]; then
        errmsg "Error: Option '--port' requires an argument."
        errmsg "Run '$0 -h' for usage."
        errmsg "Aborting."
        exit 1
      fi
      _port="$1"
      shift
    ;;
    *)
      _vite_options+=("$1")
      shift
    ;;
  esac
done
_vite_options+=('--port' "${_port}")
_vite_options+=('--strictPort') # Always do "--strictPort" for predictability.

"${_backenddir}/main_server.py" > "${_backendlog}" 2>&1 &
_backendserverpid="$!"
cd "${_uidir}"
faketty node_modules/vite/bin/vite.js "${_vite_options[@]}" > "${_webserverlog}" 2>&1 < /dev/full &
_webserverpid="$!"

_url="http://localhost:${_port}"

msg "Backend server:"
msg "  - pid:    ${_backendserverpid}"
msg "  - output: ${_backendlog}"
msg ""
msg "Web server:"
msg "  - pid:    ${_webserverpid}"
msg "  - output: ${_webserverlog}"
msg "  - url:    ${_url}"
msg ""
msg "A standalone (electron) browser window should open, pointing to ${_url}."
msg "After closing it, the web server and backend server should terminate automatically."
msg ""
msg "Combined output of backend server, web server and browser window follows in the terminal:"

tail -f "${_backendlog}" "${_webserverlog}" &
_tailpid="$!"

sleep 2
electron --disk-cache-size=0 "${_url}"

kill "${_webserverpid}" || {
  sleep 2
  kill "${_webserverpid}" || {
    sleep 2
    kill -9 "${_webserverpid}" || {
      sleep 2
      killall vite.js || {
        sleep 2
        killall vite.js || {
          sleep 2
          killall -9 vite.js
        }
      }
    }
  }
}

# Now, after finishing, kill the backend server.
kill "${_backendserverpid}" || {
  sleep 2
  kill "${_backendserverpid}" || {
    sleep 2
    kill -9 "${_backendserverpid}" || {
      sleep 2
      killall main_server.py || {
        sleep 2
        killall main_server.py || {
          sleep 2
          killall -9 main_server.py
        }
      }
    }
  }
}

# Now, finally, kill the output of the log files.
kill "${_tailpid}" || {
  sleep 2
  kill "${_tailpid}" || {
    sleep 2
    kill -9 "${_tailpid}"
  }
}