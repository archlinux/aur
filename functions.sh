#!/bin/sh

PACKAGE_NAME=remoteit
REMOTEIT_DIR=/usr/share/remoteit
CONFIG_DIR=/etc/remoteit
CONFIG_FILE=$CONFIG_DIR/config.json
ENV_FILE=$CONFIG_DIR/r3.env
REGISTRATION=$CONFIG_DIR/registration

# Actual env vars take priority over r3.env file
# Save existing R3_* environment variables
_r3_saved_vars=""
for var in $(env | grep '^R3_' | cut -d= -f1); do
    eval "_save_$var=\"\$$var\""
    _r3_saved_vars="$_r3_saved_vars $var"
done

# Source the file (sets defaults from file)
[ -f $ENV_FILE ] && . $ENV_FILE

# Restore any previously set env vars (they take priority)
for var in $_r3_saved_vars; do
    eval "$var=\"\$_save_$var\""
done

# Can be overridden via R3_INSTALL_API env var (priority) or r3.env file (fallback)
INSTALL_API=${R3_INSTALL_API:-https://install.remote.it/v1}
VERSION=$(cat $REMOTEIT_DIR/version.txt)

if [ -d "/run" ]; then
  PIDDIR="/run"
else
  PIDDIR="/var/run"
fi

# Detect which init software this device is using
if [ -d /run/systemd/system ]; then
   is_systemd=1
elif which rc-update; then
   is_openrc=1
elif which update-rc.d; then
   is_sysv=1
fi

if [ "$is_systemd" = 1 ]; then
  . $REMOTEIT_DIR/systemd.sh
else
  . $REMOTEIT_DIR/sysvinit.sh
fi

. $REMOTEIT_DIR/oem.sh

r3_update_config() {
  r3_logger "Updating remote.it configuration."

  # Check existence and writability of configuration dir
  if [ ! -w $CONFIG_DIR ]; then
    r3_logger "$CONFIG_DIR does not exist or is not writable."
    mkdir $CONFIG_DIR || exit 1
  fi

  local config

  if [ -f $CONFIG_FILE ]; then
    config=$(cat $CONFIG_FILE)
  elif [ -n "$R3_REGISTRATION_CODE" ]; then
    # You can use the remote.it license key that you set in the environment
    # variable R3_REGISTRATION_CODE for registration.
    # If you want to take over the environment variable R3_REGISTRATION_CODE
    # of the original user when using sudo command, use the "sudo -E" option.
    local registration=$R3_REGISTRATION_CODE

    [ -n "$registration" ] || return 0

    config=$(jq -n --arg registration "$registration" '{$registration}')
  elif [ -f $REGISTRATION ]; then
    local registration=$(cat $REGISTRATION)

    [ -n "$registration" ] || return 0

    config=$(jq -n --arg registration "$registration" '{$registration}')
  else
    config='{}'
  fi

  jq -n \
    --argjson config "$config" \
    --arg name "$(r3_get_name)" \
    --arg identity "$(r3_get_identity)" \
    --arg manufacturer "$(r3_get_manufacturer)" \
    --arg platform "$(r3_get_platform)" \
    --argjson metadata "$(r3_get_metadata)" \
    '$config * {$name, $identity, $manufacturer, $platform, $metadata}' | curl -sSfo $CONFIG_FILE -d @- $INSTALL_API/refresh

  if [ $? -ne 0 ]; then
    if [ ! -r $CONFIG_FILE ]; then
      r3_logger "Fail to create remote.it configuration with curl command failure."
    else
      r3_logger "Fail to update remote.it configuration with curl command failure."
    fi
    return 1
  fi
}

r3_get_config() {
  [ -r $CONFIG_FILE ] || exit 0
  config=$(jq -r --arg id "$1" '.device,.services[] | select(.sha==$id or .id==$id) | .config' "$CONFIG_FILE")
  echo $config
}

r3_get_device_id() {
  [ -r $CONFIG_FILE ] && jq -er '.device.id' "$CONFIG_FILE"
}

r3_get_claim() {
  local claim

  [ -r $CONFIG_FILE ] && claim=$(jq -er '.device.claim' "$CONFIG_FILE") && echo "$claim"
}

r3_install_agent() {
  r3_logger "Installing remote.it agent."

  mkdir -p $CONFIG_DIR

  if [ ! -x /usr/share/remoteit/connectd ]; then
    r3_logger "Installing remote.it package."

    local arch=$(r3_get_architecture)

    [ -n "$arch" ] || r3_error "Unable to determine architecture."

    local url=https://downloads.remote.it/openwrt/v5.6.1/$arch/binaries.tgz

    curl -sSfo- "$url" | tar xzf - -C $REMOTEIT_DIR 2>/dev/null || r3_error "Unknown architecture \"$arch\"."
  fi

  [ -r $CONFIG_FILE ] || r3_update_config

  ln -sfn $REMOTEIT_DIR/task_notify.sh /usr/bin/remoteit_task_notify

  # Legacy name called by job scripts, shared by coexisting packages. It
  # follows remoteit whenever remoteit is installed, whichever package runs
  # this, so an install or upgrade of either one cannot take it from the other.
  if [ -e /usr/share/remoteit/task_notify.sh ]; then
    ln -sfn /usr/share/remoteit/task_notify.sh /usr/bin/connectd_task_notify
  else
    ln -sfn $REMOTEIT_DIR/task_notify.sh /usr/bin/connectd_task_notify
  fi

  # If /run is available, move pid files stored in legacy /var/run to this dir.
  if [ -d "/run" ]; then
    mv /var/run/remoteit-*.pid /run 2>/dev/null
  fi

  r3_reload_agent

  local code=$(r3_get_claim)

  if [ "$is_systemd" = 1 ]; then
    systemctl enable remoteit-refresh.service
  elif [ "$is_openrc" = 1 ]; then
    rc-update add remoteit-main default
    service remoteit-main start 2>/dev/null
  elif [ "$is_sysv" = 1 ]; then
    update-rc.d remoteit-main defaults 99 1
  fi

  if [ -n "$code" ]; then
    echo
    echo "--------------------- Claim this device ---------------------"
    echo
    echo "Use the code $code to register this device to your account"
    echo
    echo "or navigate to remoteit://claim/$code in your browser"
    echo
    echo "--------------------- Claim this device ---------------------"
    echo
  fi
}

r3_remove_agent() {
  r3_logger "Removing remote.it agent."

  r3_stop_services

  if [ "$is_systemd" = 1 ]; then
    systemctl disable remoteit-refresh
    systemctl stop remoteit-refresh
  elif [ "$is_openrc" = 1 ]; then
    rc-update del remoteit-main default
  elif [ "$is_sysv" = 1 ]; then
    update-rc.d remoteit-main remove
  fi

  rm -f /usr/bin/remoteit_task_notify

  # Give up the shared legacy name only if this package holds it, handing it
  # to another installed package so job scripts keep working. Peer payloads
  # are the signal: older package versions never made the per-package links.
  if [ "$(readlink /usr/bin/connectd_task_notify 2>/dev/null)" = "$REMOTEIT_DIR/task_notify.sh" ]; then
    rm -f /usr/bin/connectd_task_notify
    for peer in /usr/share/*/task_notify.sh; do
      [ "$peer" = "$REMOTEIT_DIR/task_notify.sh" ] && continue
      [ -e "$peer" ] && ln -sfn "$peer" /usr/bin/connectd_task_notify && break
    done
  fi

  rm -rf /usr/share/remoteit
}

r3_reload_agent() {
  r3_update_config
  r3_start_services 2>/dev/null
}

r3_task_notify() {
  echo "200 OK"
}
