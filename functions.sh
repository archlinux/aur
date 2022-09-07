#!/bin/sh

REMOTEIT_DIR=/usr/share/remoteit
INSTALL_API=https://install.remote.it/v1
CONFIG_FILE=/etc/remoteit/config.json
REGISTRATION=/etc/remoteit/registration
VERSION=$(cat $REMOTEIT_DIR/version.txt)

# Detect whether this device can use systemd
if [ -d /run/systemd/system ]; then
   is_systemd=1
fi

if [ "$is_systemd" = 1 ]; then
  . $REMOTEIT_DIR/systemd.sh
else
  . $REMOTEIT_DIR/sysvinit.sh
fi

. $REMOTEIT_DIR/oem.sh

r3_update_config() {
  r3_logger "Updating remote.it configuration."

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
    --argjson manufacturer "$(r3_get_manufacturer)" \
    --argjson platform "$(r3_get_platform)" \
    --argjson metadata "$(r3_get_metadata)" \
    '$config * {$name, $identity, $manufacturer, $platform, $metadata}' | curl -sfo $CONFIG_FILE -d @- $INSTALL_API/refresh
}

r3_get_config() {
  [ -r $CONFIG_FILE ] || exit 0
  config=$(jq -r --arg id "$1" '.device,.services[] | select(.id==$id) | .config' "$CONFIG_FILE")
  echo $config
}

r3_get_claim() {
  local claim

  [ -r $CONFIG_FILE ] && claim=$(jq -er '.device.claim' "$CONFIG_FILE") && echo "$claim"
}

r3_install_agent() {
  r3_logger "Installing remote.it agent."

  mkdir -p /etc/remoteit

  if [ ! -x /usr/share/remoteit/connectd ]; then
    r3_logger "Installing remote.it package."

    local arch=$(r3_get_architecture)

    [ -n "$arch" ] || r3_error "Unable to determine architecture."

    local url=https://downloads.remote.it/openwrt/v4.13.0/$arch/binaries.tgz

    curl -sfo- "$url" | tar xzf - -C $REMOTEIT_DIR 2>/dev/null || r3_error "Unknown architecture \"$arch\"."
  fi

  [ -r $CONFIG_FILE ] || r3_update_config

  ln -sf $REMOTEIT_DIR/task_notify.sh /usr/bin/connectd_task_notify

  r3_reload_agent

  local code=$(r3_get_claim)

  if [ "$is_systemd" = 1 ]; then
    systemctl enable remoteit-refresh.service
  fi

  if [ "$is_systemd" != 1 ]; then
    update-rc.d remoteit-main defaults 99
  fi

  if [ -n "$code" ]; then
    echo
    echo "--------------------- Claim this device ---------------------"
    echo
    echo "Use the code $code to register this device to your account"
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
  fi

  if [ "$is_systemd" != 1 ]; then
    rm -f /etc/init.d/remoteit-main
  fi

  rm -f /usr/bin/connectd_task_notify

  rm -r /usr/share/remoteit
}

r3_reload_agent() {
  r3_update_config
  r3_start_services 2>/dev/null
}

r3_task_notify() {
  echo "200 OK"
}
