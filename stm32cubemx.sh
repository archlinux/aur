#!/bin/sh
exec archlinux-java-run --min 17 -- -jar /opt/stm32cubemx/STM32CubeMX "$@"
