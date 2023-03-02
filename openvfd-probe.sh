#!/bin/bash -e

if ! . /etc/conf.d/openvfd; then
  echo 'openvfd-probe: failed to source configuration file /etc/conf.d/openvfd' >&2
  exit 1
fi

if [[ -z "${conf}" ]]; then
  echo 'openvfd-probe: conf is not set in /etc/conf.d/openvfd' >&2
  exit 1
fi

if ! . "/usr/share/openvfd/${conf}.conf"; then
  echo "openvfd-probe: failed to read configuration file '/usr/share/openvfd/${conf}.conf'" >&2
  exit 1
fi

if ! /usr/bin/modprobe openvfd \
  "vfd_gpio_clk=${vfd_gpio_clk}" \
  "vfd_gpio_dat=${vfd_gpio_dat}" \
  "vfd_gpio_stb=${vfd_gpio_stb:-0,0,0xFF}" \
  "vfd_gpio0=${vfd_gpio0:-0,0,0xFF}" \
  "vfd_gpio1=${vfd_gpio1:-0,0,0xFF}" \
  "vfd_gpio2=${vfd_gpio2:-0,0,0xFF}" \
  "vfd_gpio3=${vfd_gpio3:-0,0,0xFF}" \
  "vfd_gpio_protocol=${vfd_gpio_protocol:-0,0}" \
  "vfd_chars=${vfd_chars}" \
  "vfd_dot_bits=${vfd_dot_bits}" \
  "vfd_display_type=${vfd_display_type}"; then
  echo 'openvfd-probe: failed to load module openvfd' >&2
  exit 1
fi

for func in ${functions}; do
  echo "openvfd-probe: turning on addtional function ${func}"
  if ! echo "${func}" > /sys/class/leds/openvfd/led_on; then
    echo "openvfd-probe: failed to turn on addtional function ${func}"
    exit 1
  fi
done