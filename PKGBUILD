# Maintainer: mensylisir <710080675@qq.com>

pkgname=minimax-code-intl-bin
pkgver=3.1.12
pkgrel=1
_electron=42.11.16
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

# The installer bundles Electron 42.11.16; the runtime is replaced with the
# official build of the same version so native modules rebuild against matching
# headers. Upstream republishes installers in place, so the checksum below is
# the only thing that changes between identical pkgver builds.
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
  '323e5c116f243ca097d4d236a39c396ab7f7d5d9bfb10676783e53287832d42b'
  'e27e9ec78d12edc83c817a1454b706530c000eedd217f65aed2a5d9657ec1be0'
  '4cad5a9290c681202d92bd9e991dc1708b69df4c9c3bdcfd67a9ba1e0bdb2646'
  'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
  'b10455d15a977c0cd17a1cb0eb679e03d939f8ef8d4302eb33e1f78dacc71f82'
  'e2021aeed80de4f15212525e30565756aaae790e68e3229df6d1345f43803221'
  '8cc06e25e29f9c258ee9a09eecd7707c1ea2e99d9e76151e53dbe39f8d6b4a09'
  '45a2df04cccab5567483d557a14c655cb8c4e31305de6159bf05fd070ddcea00'
  '08e05d837c6b3faefdd3e77ac3155c2654392a62d241961bcccc221f3783170a'
  '7d8c1a7c78fdf013bddd4e9dd20578467d63f18c2f81ba1819b11c5ce4c06f6f'
  '61f607d01b09eb6a7d7f9555522a33f72d4887befbbe25f3c95bbb4e7ba3cebd'
  'ef50b80ae1d55a5f48c94db21cf74c3543723af4e89f85eb9d80c0900b1efdf1'
  'd44c2e236aee3b2fe75d5814ef0891e6e9016c9c328d8b2a8582d0db7073ca61'
  '51129318ed37e1667a0fd6f9bed69c68d1f4f6a4075b1125f29876e14303dba7'
  'cdc0934a46c49fdd3b27966bd349649bb6242e37d4f7a8a3833777181b40b515'
  '41a2995e4c11f4f0115c5b6e8e1329a0466f52998eb4fa5515f9f7af9ea35e57'
  'f0fb4902eba28e5508fd0c2ce9805790f15addb7533b86e139d4d195b0edecae'
  'd3391f76936621cd466025cd4f2d058fbcd0fd77b447cdb8bf9d0428387d6c62'
  '8589ee3b9b7e16e658113b5649cdbfba41ce8a01e7311349300c78f82b465f0c'
  'c976038eda2246a3acf37af352b7c462b43128ff043291c9e0c3863cf52832f9'
  'd25d5e5ce18c9549675d9b487707dbae21eb9640a98869b8e53922501e3242cf'
  '2516e1e9c8cc98ca53c065eae97a7922174ba5d4da01babec960f1c254f67833'
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
