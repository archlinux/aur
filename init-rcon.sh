#!/bin/bash

# The working directory should be the same as Minecraft's
# (Making it implicit allows users to change the WorkingDirectory in the
# systemd unit file.)
conf=server.properties

if [ ! -e "$conf" ]; then
  # Create server.properties if it does not exist yet and configure rcon
  (
    umask 007
    cat > "$conf" <<EOF
enable-rcon=true
rcon.password=$(dd if=/dev/urandom count=1 bs=9 2> /dev/null | base64)
EOF
  )
fi

rcon=$(grep '^enable-rcon=' $conf)
rcon=${rcon#enable-rcon=}
port=$(grep '^rcon.port=' $conf)
port=${port#rcon.port=}
port=${port:-25575}
password="$(grep '^rcon.password=' $conf)"
password="${password#rcon.password=}"

if ! which mcrcon > /dev/null 2>&1; then
  echo "mcrcon not installed. Won't warn users during shutdown."
  rcon=
elif [ "$rcon" != true -o -z "$password" ]; then
  echo "RCON not enabled. Won't warn users during shutdown."
  echo "For full functionality, enable RCON in $conf by adding:"
  echo "    enable-rcon=true"
  echo "    rcon.password=<some password>"
  echo "You may want to protect the configuration with chmod as well"
  rcon=
fi


(
  umask 007
  cat > "$RUNTIME_DIR/vars" <<EOF
rcon=$rcon
port=$port
password="$password"
EOF
)
