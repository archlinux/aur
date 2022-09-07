#!/bin/sh

METADATA_URL=http://169.254.169.254/latest/meta-data

r3_logger() {
  logger -t remoteit "$@"
}

r3_get_architecture() {
  uname -m
}

r3_is_ec2() {
  curl -s -f -m 1 $METADATA_URL > /dev/null
  echo $?
}

isEc2=$(r3_is_ec2)

r3_get_name() {
  if [ -n "$R3_DEVICE_NAME" ]; then
    echo $R3_DEVICE_NAME
  elif [ "$isEc2" -eq 0 ]; then
    curl -s $METADATA_URL/instance-id | sed -e 's/-//g'
  else
    cat /proc/sys/kernel/hostname
  fi
}

r3_get_macaddr() {
  if [ "$isEc2" -eq 0 ]; then
    curl -s $METADATA_URL/mac
  else
    ip link show up | grep ether | head -n 1 | awk '{print $2}'
  fi
}

r3_get_model() {
  if [ "$isEc2" -eq 0 ]; then
    curl -s $METADATA_URL/instance-type | sed -e 's/\.//g'
  elif [ -r /sys/devices/virtual/dmi/id/product_family ]; then
    cat /sys/devices/virtual/dmi/id/product_family
  else
    echo NOT_DETECTED
  fi
}

r3_get_serial() {
  if [ "$isEc2" -eq 0 ]; then
    curl -s $METADATA_URL/instance-id | sed -e 's/-//g'
  elif [ -r /sys/devices/virtual/dmi/id/product_serial ]; then
    cat /sys/devices/virtual/dmi/id/product_serial
  else
    echo NOT_DETECTED
  fi
}

r3_get_identity() {
  r3_get_macaddr
}

r3_get_manufacturer() {
  echo 34304
}

r3_get_platform() {
  if [ -n "$R3_PLATFORM_CODE" ]; then
    platformcode=$R3_PLATFORM_CODE
    echo $platformcode
  elif [ "$isEc2" -eq 0 ]; then
    echo 1185
  else
    echo 769
  fi
}

r3_get_metadata() {
  jq -n \
    --arg version "$VERSION" \
    --arg installDir "$REMOTEIT_DIR" \
    --arg macAddress "$(r3_get_macaddr)" \
    --arg model "$(r3_get_model)" \
    --arg serialNum "$(r3_get_serial)" \
    '{$version, $installDir, $macAddress, $model, $serialNum}'
}
