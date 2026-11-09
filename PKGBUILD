# Maintainer: mensylisir <710080675@qq.com>

pkgname=minimax-code-intl-bin
pkgver=3.1.11
pkgrel=1
_electron=42.11.2
pkgdesc='MiniMax Code 桌面应用（国际版），非官方 Linux 移植'
arch=('x86_64')
url='https://code.minimax.io/'
license=('LicenseRef-proprietary')
depends=(
  'gtk3' 'nss' 'alsa-lib' 'libcups' 'libdrm' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi'
  'libxkbcommon' 'libxrandr' 'mesa' 'libsecret'
  'libappindicator' 'libpulse' 'json-glib' 'wayland' 'systemd-libs' 'dbus'
  'libnotify'
)
makedepends=('7zip' 'unzip' 'nodejs' 'node-gyp' 'python' 'gcc' 'make')
optdepends=(
  'bubblewrap: 工具执行沙箱隔离'
  'libreoffice-fresh: PPTX 转 PDF/图片'
  'poppler: PDF 渲染与转换'
  'gnome-keyring: 系统密钥环支持'
)
options=('!strip' '!debug' '!lto')

source=(
  "minimax-code-${pkgver}.exe::https://file.cdn.minimax.io/public/minimax-agent-prod/release/MiniMax%20Code%20Setup%20${pkgver}.exe"
  "electron-v${_electron}-linux-x64.zip::https://github.com/electron/electron/releases/download/v${_electron}/electron-v${_electron}-linux-x64.zip"
  "node-v${_electron}-headers.tar.gz::https://artifacts.electronjs.org/headers/dist/v${_electron}/node-v${_electron}-headers.tar.gz"
  'node-pty-1.1.0.tgz::https://registry.npmjs.org/node-pty/-/node-pty-1.1.0.tgz'
  'node-addon-api-7.1.1.tgz::https://registry.npmjs.org/node-addon-api/-/node-addon-api-7.1.1.tgz'
  'better-sqlite3-v12.11.1-electron-v146-linux-x64.tar.gz::https://github.com/WiseLibs/better-sqlite3/releases/download/v12.11.1/better-sqlite3-v12.11.1-electron-v146-linux-x64.tar.gz'
  'vscode-ripgrep-linux-x64-1.18.0.tgz::https://registry.npmjs.org/@vscode/ripgrep-linux-x64/-/ripgrep-linux-x64-1.18.0.tgz'
  'trycua-cua-driver-linux-x64-gnu-0.34.1.tgz::https://registry.npmjs.org/@trycua/cua-driver-linux-x64-gnu/-/cua-driver-linux-x64-gnu-0.34.1.tgz'
  'ubjs-node-linux-x64-gnu-0.31.0-3.tgz::https://registry.npmjs.org/@ubjs/node-linux-x64-gnu/-/node-linux-x64-gnu-0.31.0-3.tgz'
  'node-screenshots-linux-x64-gnu-0.2.8.tgz::https://registry.npmjs.org/node-screenshots-linux-x64-gnu/-/node-screenshots-linux-x64-gnu-0.2.8.tgz'
  'patch-region.js'
  'repack-asar.js'
  'minimax-code-intl.sh'
  'minimax-code-intl.desktop'
  'minimax-code-intl-16.png'
  'minimax-code-intl-24.png'
  'minimax-code-intl-32.png'
  'minimax-code-intl-48.png'
  'minimax-code-intl-64.png'
  'minimax-code-intl-128.png'
  'minimax-code-intl-256.png'
  'minimax-code-intl-512.png'
)
sha256sums=(
  '43fb340d22ab103f40b3306319d5bfe00d6e56ef4d7fb81e5e149cbd254b0b40'
  '1e0b2a6d59bb8836858a24dec454c36e15a904dd1000a1053c8e36ecc44333bc'
  'b586bf9cc6352053f9e075ed06a160a42653971742fd1746e8951e6942d55879'
  'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
  'b10455d15a977c0cd17a1cb0eb679e03d939f8ef8d4302eb33e1f78dacc71f82'
  'e2021aeed80de4f15212525e30565756aaae790e68e3229df6d1345f43803221'
  '8cc06e25e29f9c258ee9a09eecd7707c1ea2e99d9e76151e53dbe39f8d6b4a09'
  '45a2df04cccab5567483d557a14c655cb8c4e31305de6159bf05fd070ddcea00'
  '08e05d837c6b3faefdd3e77ac3155c2654392a62d241961bcccc221f3783170a'
  '7d8c1a7c78fdf013bddd4e9dd20578467d63f18c2f81ba1819b11c5ce4c06f6f'
  'f9c282e862efe6052bd6ffbc0669a5adb3c02fefbb004670378a076a232d1cc3'
  'ef50b80ae1d55a5f48c94db21cf74c3543723af4e89f85eb9d80c0900b1efdf1'
  'd44c2e236aee3b2fe75d5814ef0891e6e9016c9c328d8b2a8582d0db7073ca61'
  '51129318ed37e1667a0fd6f9bed69c68d1f4f6a4075b1125f29876e14303dba7'
  '1523c2807ea870c3a965bca2021c589bceb4d95eb114bd464de2f758200d7fec'
  'f0179ec708e0ae1ddf5c65890a7b77333a8c826ca9bfd940e021b3e860eb8630'
  '1cadadf7c0af5d91ababe7b4be2d9d99a918431f5475443b122c46ba4195af59'
  '910a40896cb7ccd27d7b12deef41635f9771774bd5babb9d0849b39e4e8cce10'
  '213d6ae218b3a4c77f52c5b06a698a4b89bd0b8706e958dcf3c62b2ccf83fd4a'
  '618f522dbd26e40aa0f98c94884a8a1f850bf3a63ab42af2a38c7ce274034e90'
  '06e22fa7a68d513901d2cfa85ab5d37b6852191a4a957e95df381fe1cd00a959'
  'c27b2534292a08a01705bd1b949b8f4bc52cac44e11c5e6f5f2db36839b27991'
)

noextract=(
  "minimax-code-${pkgver}.exe"
  "electron-v${_electron}-linux-x64.zip"
  "node-v${_electron}-headers.tar.gz"
  'node-pty-1.1.0.tgz'
  'node-addon-api-7.1.1.tgz'
  'better-sqlite3-v12.11.1-electron-v146-linux-x64.tar.gz'
  'vscode-ripgrep-linux-x64-1.18.0.tgz'
  'trycua-cua-driver-linux-x64-gnu-0.34.1.tgz'
  'ubjs-node-linux-x64-gnu-0.31.0-3.tgz'
  'node-screenshots-linux-x64-gnu-0.2.8.tgz'
)

pkg_extract() {
  local tgz=$1 dest=$2 tmp
  tmp=$(mktemp -d)
  tar -xzf "$tgz" -C "$tmp" --strip-components=1
  install -dm755 "$dest"
  cp -a "$tmp/." "$dest/"
  # cp -a 会把 mktemp 的 0700 套到目标目录上，普通用户将无法进入。
  chmod 755 "$dest"
  find "$dest" -type d -exec chmod 755 {} +
  rm -rf "$tmp"
}

prepare() {
  cd "$srcdir"
  # 重复构建时必须先清掉旧的解包结果，否则 patch-region 会作用在已打补丁的 asar 上。
  rm -rf "$srcdir/nsis" "$srcdir/payload"
  7z x -y -o"$srcdir/nsis" "minimax-code-${pkgver}.exe" >/dev/null
  7z x -y -o"$srcdir/payload" "$srcdir/nsis/\$PLUGINSDIR/app-64.7z" >/dev/null
  node "$srcdir/patch-region.js" "$srcdir/payload/resources/app.asar" intl
}

build() {
  cd "$srcdir"
  rm -rf "$srcdir/stage"
  install -dm755 "$srcdir/stage"
  unzip -q "$srcdir/electron-v${_electron}-linux-x64.zip" -d "$srcdir/stage"
  mv "$srcdir/stage/electron" "$srcdir/stage/minimax-code"
  rm -f "$srcdir/stage/chrome-sandbox" "$srcdir/stage/resources/default_app.asar"

  cp "$srcdir/payload/resources/app.asar" "$srcdir/stage/resources/app.asar"
  cp -a "$srcdir/payload/resources/app.asar.unpacked" "$srcdir/stage/resources/app.asar.unpacked"
  cp -a "$srcdir/payload/resources/resources" "$srcdir/stage/resources/resources"
  rm -f "$srcdir/stage/resources/app-update.yml"

  local nm="$srcdir/stage/resources/app.asar.unpacked/node_modules"
  # Drop the Windows/macOS binaries that shipped in the upstream payload.
  find "$nm" -maxdepth 3 -type d \( -name '*win32*' -o -name '*darwin*' \) -prune -exec rm -rf {} +
  rm -rf "$nm/@earendil-works/pi-tui/native"
  rm -rf "$nm/node-pty/prebuilds"
  rm -rf "$nm/@minimax/mcode-sandbox-runtime/vendor/srt-win"
  find "$nm" -type f \( -name '*.exe' -o -name '*.dll' \) -delete
  # resources 下只有 win32-x64 目录，Linux 不可执行，直接移除。
  find "$srcdir/stage/resources/resources" -type d -name 'win32-x64' -prune -exec rm -rf {} +

  # Linux replacements for the unpacked native modules.
  pkg_extract "$srcdir/vscode-ripgrep-linux-x64-1.18.0.tgz" "$nm/@vscode/ripgrep-linux-x64"
  pkg_extract "$srcdir/trycua-cua-driver-linux-x64-gnu-0.34.1.tgz" "$nm/@trycua/cua-driver-linux-x64-gnu"
  pkg_extract "$srcdir/ubjs-node-linux-x64-gnu-0.31.0-3.tgz" "$nm/@ubjs/node-linux-x64-gnu"
  pkg_extract "$srcdir/node-screenshots-linux-x64-gnu-0.2.8.tgz" "$nm/node-screenshots-linux-x64-gnu"

  mkdir -p "$srcdir/bs3"
  tar -xzf "$srcdir/better-sqlite3-v12.11.1-electron-v146-linux-x64.tar.gz" -C "$srcdir/bs3"
  install -dm755 "$nm/better-sqlite3/build/Release"
  cp "$srcdir/bs3/build/Release/better_sqlite3.node" "$nm/better-sqlite3/build/Release/better_sqlite3.node"

  # node-pty has no Linux prebuilt for these Electron headers; build from source.
  local pty="$srcdir/build-node-pty" hdrs="$srcdir/build-headers"
  pkg_extract "$srcdir/node-pty-1.1.0.tgz" "$pty"
  pkg_extract "$srcdir/node-addon-api-7.1.1.tgz" "$pty/node_modules/node-addon-api"
  install -dm755 "$hdrs"
  tar -xzf "$srcdir/node-v${_electron}-headers.tar.gz" -C "$hdrs"
  (
    cd "$pty"
    node-gyp rebuild --nodedir="$hdrs/node_headers" --target_arch=x64 --release
  ) >"$srcdir/node-pty-build.log" 2>&1 || {
    tail -n 40 "$srcdir/node-pty-build.log" >&2
    return 1
  }
  install -dm755 "$nm/node-pty/build/Release"
  cp "$pty/build/Release/pty.node" "$nm/node-pty/build/Release/pty.node"
  find "$nm" -type f -name '*.node' -exec chmod 755 {} +

  node "$srcdir/repack-asar.js" "$srcdir/stage/resources/app.asar" \
    "$srcdir/stage/resources/app.asar.unpacked"
}

package() {
  install -dm755 "$pkgdir/opt"
  cp -a "$srcdir/stage" "$pkgdir/opt/minimax-code-intl"

  install -Dm755 "$srcdir/minimax-code-intl.sh" "$pkgdir/usr/bin/minimax-code"
  install -Dm644 "$srcdir/minimax-code-intl.desktop" \
    "$pkgdir/usr/share/applications/minimax-code-intl.desktop"

  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/minimax-code-intl-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/minimax-code-intl.png"
  done

  install -Dm644 "$srcdir/stage/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
  install -Dm644 "$srcdir/stage/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
