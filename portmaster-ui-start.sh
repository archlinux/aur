#!/bin/bash

# WEBKIT_DISABLE_COMPOSITING_MODE=1 disables hardware acceleration in WebKit
# This prevents rendering issues on certain Linux systems
# with problematic GPU drivers or configurations. For Tauri 2 applications like Portmaster,
# this forces software rendering which provides more consistent behavior across different
# Linux distributions and hardware combinations.

WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/lib/portmaster/portmaster "$@"