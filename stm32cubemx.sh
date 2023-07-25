#!/bin/sh
exec archlinux-java-run --min 11 --max 20 -- -jar /opt/stm32cubemx/STM32CubeMX "$@"
