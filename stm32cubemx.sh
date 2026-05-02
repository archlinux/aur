#!/bin/sh
if [ -x /opt/stm32cubemx/jre/bin/java ]; then
  exec /opt/stm32cubemx/jre/bin/java -jar /opt/stm32cubemx/STM32CubeMX "$@"
else
  exec archlinux-java-run --min 21 -- -jar /opt/stm32cubemx/STM32CubeMX "$@"
fi
