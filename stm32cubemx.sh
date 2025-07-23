#!/bin/sh
exec archlinux-java-run --min 21 -- -jar /opt/stm32cubemx/STM32CubeMX "$@"
