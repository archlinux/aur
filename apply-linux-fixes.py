#!/usr/bin/env python3
"""Apply Linux compatibility fixes to Mineradio source code.

Fixes for the Linux port (v2.1.0):
  1. GPU 渲染: 移除 Windows 专属的 use-angle=d3d11 等开关, 修复 Linux 下 GPU 崩溃
  2. 图标格式: Linux 下用 icon.png 替代 icon.ico
  3. 缓存路径: D:\\MineradioCache 改为 ~/.cache/Mineradio (XDG 规范)
  4. 窗口配置: Linux 下关闭透明窗口(Wayland 渲染异常), 保留无边框自带标题栏
  5. 全屏: Linux 下跳过 setResizable guard (与 setFullScreen 冲突)
  6. 全屏标题栏: Linux 下全屏保持标题栏显示, 登录信息下移避开重叠
  7. 桌面歌词: Linux 下窗口可交互(中键切换锁定 + 左键拖动)
  8. 构建配置: package.json 添加 electron-builder Linux 目标
"""

import os
import sys

os.chdir(sys.argv[1] if len(sys.argv) > 1 else '.')

def apply(path, replacements):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
    for old, new in replacements:
        if old not in content:
            print(f"WARN: pattern not found in {path}: {old[:70]!r}")
            continue
        content = content.replace(old, new, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"OK: {path}")

# --- desktop/main.js ---
apply('desktop/main.js', [
    ("const fs = require('fs');\nconst crypto = require('crypto');",
     "const fs = require('fs');\nconst os = require('os');\nconst crypto = require('crypto');"),
    ("const APP_ICON_ICO = path.join(__dirname, '..', 'build', 'icon.ico');",
     "const APP_ICON_ICO = path.join(__dirname, '..', 'build', process.platform === 'win32' ? 'icon.ico' : 'icon.png');"),
    (r"""function defaultCacheRootPath() {
  const dDrive = 'D:\\';
  return fs.existsSync(dDrive)
    ? path.join(dDrive, 'MineradioCache')
    : path.join(app.getPath('userData'), 'cache');
}""",
     r"""function defaultCacheRootPath() {
  if (process.platform === 'win32') {
    const dDrive = 'D:\\';
    return fs.existsSync(dDrive)
      ? path.join(dDrive, 'MineradioCache')
      : path.join(app.getPath('userData'), 'cache');
  }
  return path.join(os.homedir(), '.cache', 'Mineradio');
}"""),
    (r"""const CHROMIUM_SAFE_PERFORMANCE_SWITCHES = [
  ['autoplay-policy', 'no-user-gesture-required'],
  ['enable-gpu-rasterization'],
  ['enable-oop-rasterization'],
  ['enable-zero-copy'],
  ['enable-accelerated-2d-canvas'],
  ['use-angle', 'd3d11'],
];""",
     r"""const CHROMIUM_SAFE_PERFORMANCE_SWITCHES = [
  ['autoplay-policy', 'no-user-gesture-required'],
  ...(process.platform === 'win32' ? [
    ['enable-gpu-rasterization'],
    ['enable-oop-rasterization'],
    ['enable-zero-copy'],
    ['enable-accelerated-2d-canvas'],
    ['use-angle', 'd3d11'],
  ] : []),
];"""),
    ("function setMainWindowFullscreenResizeGuard(win, fullscreen) {\n  if (!win || win.isDestroyed()) return;\n  const shouldResize = !fullscreen;",
     "function setMainWindowFullscreenResizeGuard(win, fullscreen) {\n  if (!win || win.isDestroyed()) return;\n  if (process.platform === 'linux') return;\n  const shouldResize = !fullscreen;"),
    ("      angle: 'd3d11',",
     "      angle: process.platform === 'win32' ? 'd3d11' : 'default',"),
    ("  const shouldIgnore = locked || !desktopLyricsPointerCapture;",
     "  const shouldIgnore = process.platform === 'linux' ? false : (locked || !desktopLyricsPointerCapture);"),
    ("    transparent: true,\n    opacity: process.env.MINERADIO_STARTUP_QA_HIDDEN === '1' ? 0 : 1,\n    backgroundColor: '#00000000',",
     "    transparent: process.platform === 'win32',\n    opacity: process.env.MINERADIO_STARTUP_QA_HIDDEN === '1' ? 0 : 1,\n    backgroundColor: process.platform === 'win32' ? '#00000000' : '#1a1a1a',"),
])

# --- server.js ---
apply('server.js', [
    ("const fs   = require('fs');\nconst path = require('path');",
     "const fs   = require('fs');\nconst os   = require('os');\nconst path = require('path');"),
    (r"const BEATMAP_CACHE_DIR = process.env.MINERADIO_BEAT_CACHE_DIR || 'D:\\MineradioCache\\beatmaps';",
     r"const BEATMAP_CACHE_DIR = process.env.MINERADIO_BEAT_CACHE_DIR || (process.platform === 'win32' ? 'D:\\MineradioCache\\beatmaps' : path.join(os.homedir(), '.cache', 'Mineradio', 'beatmaps'));"),
    ("    serveStatic(res, path.join(__dirname, 'build', 'icon.ico'));",
     "    serveStatic(res, path.join(__dirname, 'build', process.platform === 'win32' ? 'icon.ico' : 'icon.png'));"),
])

# --- desktop/preload.js ---
apply('desktop/preload.js', [
    ("window.addEventListener('DOMContentLoaded', () => {\n  document.documentElement.classList.add('desktop-shell-root');\n  document.body.classList.add('desktop-shell');\n});",
     "window.addEventListener('DOMContentLoaded', () => {\n  document.documentElement.classList.add('desktop-shell-root');\n  document.body.classList.add('desktop-shell');\n  if (process.platform === 'linux') document.body.classList.add('platform-linux');\n});"),
])

# --- package.json ---
apply('package.json', [
    ('"build:win:internal-beta": "electron-builder --config electron-builder.internal-beta.json --win nsis --publish never"',
     '"build:win:internal-beta": "electron-builder --config electron-builder.internal-beta.json --win nsis --publish never",\n    "build:linux": "electron-builder --linux dir"'),
    ('"nsis": {\n      "oneClick": false,',
     '"linux": {\n      "icon": "build/icon.png",\n      "category": "AudioVideo",\n      "target": [\n        {\n          "target": "dir",\n          "arch": [\n            "x64"\n          ]\n        }\n      ]\n    },\n    "nsis": {\n      "oneClick": false,'),
])

# --- public/css/index.css ---
apply('public/css/index.css', [
    ("body.desktop-shell.desktop-fullscreen #desktop-titlebar,\nhtml:fullscreen body.desktop-shell #desktop-titlebar {\n  display: none !important\n}",
     "body.desktop-shell.desktop-fullscreen #desktop-titlebar,\nhtml:fullscreen body.desktop-shell #desktop-titlebar {\n  display: none !important\n}\n\nbody.platform-linux.desktop-shell.desktop-fullscreen #desktop-titlebar,\nhtml:fullscreen body.platform-linux.desktop-shell #desktop-titlebar {\n  display: flex !important\n}\n\nbody.platform-linux.desktop-shell.desktop-fullscreen #top-right {\n  top: 58px\n}"),
])

# --- public/desktop-lyrics.html ---
apply('public/desktop-lyrics.html', [
    ("      if (evt.button === 1) {\n        evt.preventDefault();\n        hideInteractionHint();\n        return;\n      }",
     "      if (evt.button === 1) {\n        evt.preventDefault();\n        hideInteractionHint();\n        setLocked(!isLocked());\n        return;\n      }"),
])

print("All Linux fixes applied successfully")
