#!/usr/bin/env python3
"""Apply Linux compatibility fixes to Mineradio source code."""

import os
import sys

os.chdir(sys.argv[1] if len(sys.argv) > 1 else '.')

# Fix 1: desktop/main.js - icon path
with open('desktop/main.js', 'r') as f:
    content = f.read()

content = content.replace(
    "const APP_ICON_ICO = path.join(__dirname, '..', 'build', 'icon.ico');",
    "const APP_ICON_ICO = path.join(__dirname, '..', 'build', process.platform === 'win32' ? 'icon.ico' : 'icon.png');"
)

# Fix 2: desktop/main.js - GPU switches (the critical fix)
old = """const CHROMIUM_PERFORMANCE_SWITCHES = [
  ['autoplay-policy', 'no-user-gesture-required'],
  ['ignore-gpu-blocklist'],
  ['enable-gpu-rasterization'],
  ['enable-oop-rasterization'],
  ['enable-zero-copy'],
  ['enable-accelerated-2d-canvas'],
  ['disable-background-timer-throttling'],
  ['disable-renderer-backgrounding'],
  ['disable-backgrounding-occluded-windows'],
  ['force_high_performance_gpu'],
  ['use-angle', 'd3d11'],
];"""

new = """const CHROMIUM_PERFORMANCE_SWITCHES = [
  ['autoplay-policy', 'no-user-gesture-required'],
  ...(process.platform === 'win32' ? [
    ['ignore-gpu-blocklist'],
    ['enable-gpu-rasterization'],
    ['enable-oop-rasterization'],
    ['enable-zero-copy'],
    ['enable-accelerated-2d-canvas'],
    ['force_high_performance_gpu'],
    ['use-angle', 'd3d11'],
  ] : []),
  ['disable-background-timer-throttling'],
  ['disable-renderer-backgrounding'],
  ['disable-backgrounding-occluded-windows'],
];"""

content = content.replace(old, new)

with open('desktop/main.js', 'w') as f:
    f.write(content)

# Fix 3: server.js - beatmap cache path
with open('server.js', 'r') as f:
    content = f.read()

old_cache = "const BEATMAP_CACHE_DIR = process.env.MINERADIO_BEAT_CACHE_DIR || 'D:\\\\MineradioCache\\\\beatmaps';"
new_cache = "const BEATMAP_CACHE_DIR = process.env.MINERADIO_BEAT_CACHE_DIR || (process.platform === 'win32' ? 'D:\\\\MineradioCache\\\\beatmaps' : path.join(require('os').homedir(), '.cache', 'Mineradio', 'beatmaps'));"

content = content.replace(old_cache, new_cache)

with open('server.js', 'w') as f:
    f.write(content)

print("All Linux fixes applied successfully")
