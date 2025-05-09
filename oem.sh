#!/bin/sh

METADATA_URL=http://169.254.169.254/latest/meta-data

r3_logger() {
  logger -t remoteit "$@"
}

r3_get_architecture() {
  if [ -n "$R3_ARCHITECTURE" ]; then
    echo $R3_ARCHITECTURE
  else
    uname -m
  fi
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
  if [ -n "$R3_DEVICE_MODEL" ]; then
    echo "$R3_DEVICE_MODEL"
  elif [ "$isEc2" -eq 0 ]; then
    curl -s $METADATA_URL/instance-type | sed -e 's/\.//g'
  elif [ -r /sys/devices/virtual/dmi/id/product_family ]; then
    cat /sys/devices/virtual/dmi/id/product_family
  elif [ -r /proc/device-tree/model ]; then
    cat /proc/device-tree/model
  else
    echo NOT_DETECTED
  fi
}

r3_get_serial() {
  if [ -n "$R3_DEVICE_SERIAL" ]; then
    echo "$R3_DEVICE_SERIAL"
  elif [ "$isEc2" -eq 0 ]; then
    curl -s $METADATA_URL/instance-id | sed -e 's/-//g'
  elif [ -r /sys/devices/virtual/dmi/id/product_serial ]; then
    cat /sys/devices/virtual/dmi/id/product_serial
  elif [ -r /proc/device-tree/serial-number ]; then
    cat /proc/device-tree/serial-number
  else
    echo NOT_DETECTED
  fi
}

r3_get_identity() {
  r3_get_macaddr
}

r3_get_manufacturer() {
  if [ -n "$R3_MANUFACTURER_CODE" ]; then
    echo "$R3_MANUFACTURER_CODE"
  else
    echo 34304
  fi
}

r3_get_platform() {
  if [ -n "$R3_PLATFORM_CODE" ]; then
    echo "$R3_PLATFORM_CODE"
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
