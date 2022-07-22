#!/bin/sh
exec archlinux-java-run --min 11 --max 11 -- -jar /opt/stm32cubemx/STM32CubeMX "$@"