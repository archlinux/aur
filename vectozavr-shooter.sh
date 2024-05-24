#!/bin/sh

while true; do
    case "$1" in
        -h | --help )
            echo \
"usage: vectozavr-shooter [-f/--force] [-n/--nickname <nickname>] [ip][:[port]]

options:
  -f/--force     copy shooter's folder even if it already exists
  -n/--nickanme  your nickname (default is PlayerName)
  ip             ip to connect. Set to 127.0.0.1 (default value) if you want to
                 run a server
  port           port game will connect to (also server will listen on this
                 port) (default is 54000)"
            exit
        ;;
        -f | --force )
            FORCE=1
            shift
        ;;
        -n | --nickname )
            NICKNAME="$2"
            shift 2
        ;;
        -- ) shift; break ;;
        * ) break ;;
    esac
done

FORCE=${FORCE:-}
NICKNAME=${NICKNAME:-PlayerName}

IP=${1%%:*}
PORT=${1##*:}
if [ -z "$IP" ]; then
    IP="127.0.0.1"
fi
if [ -z "$PORT" ] || (echo $1 | grep -qv ":"); then
    PORT="54000"
fi

if [ ! -d "$HOME/.var/vectozavr-shooter/" ] || [ ! -z "$FORCE" ]; then
    mkdir -p "$HOME/.var/vectozavr-shooter/"
    cp -r /opt/vectozavr-shooter/* "$HOME/.var/vectozavr-shooter/"
fi

cd "$HOME/.var/vectozavr-shooter/"
echo "$PORT" > server.txt
echo "$IP
$PORT
$NICKNAME" > connect.txt

./shooter
