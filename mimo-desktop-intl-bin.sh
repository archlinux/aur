#!/bin/sh
# MiMo Desktop serialises its agent configuration into an oversized
# environment string; see envguard.c for why every execve() then fails.
exec env LD_PRELOAD=/usr/lib/mimo-desktop-intl-bin/envguard.so \
  "/opt/Xiaomi MiMo AI/xiaomi-mimo-desktop-ai" "$@"
