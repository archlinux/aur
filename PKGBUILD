# Maintainer: mensylisir <710080675@qq.com>

pkgname=catpaw-cn
pkgver=2026.1016.0034
pkgrel=1
_electron=42.11.2
_node=24.18.0
_python=3.12.13
pkgdesc='妙手 AI Agent 桌面应用（国内版），非官方 Linux 移植'
arch=('x86_64')
url='https://catpaw.meituan.com/'
license=('custom')
depends=(
  'gtk3' 'nss' 'alsa-lib' 'libcups' 'libdrm' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi'
  'libxkbcommon' 'libxrandr' 'mesa' 'libsecret'
  'libappindicator' 'libpulse' 'json-glib' 'wayland' 'systemd-libs' 'dbus'
  'libnotify'
)
makedepends=('7zip' 'unzip' 'nodejs' 'node-gyp' 'python' 'gcc' 'make')
optdepends=(
  'libreoffice-fresh: PPTX 转 PDF/图片'
  'poppler: PDF 渲染与转换（pdftoppm）'
  'pandoc-cli: DOCX 高级文本转换'
  'tesseract: OCR 识别'
  'qpdf: PDF 处理'
  'gnome-keyring: 系统密钥环支持'
)
options=('!strip' '!debug' '!lto')

source=(
  "catpaw-cn-${pkgver}.dmg::https://s3plus.meituan.net/catpaw-external-resources/ide/darwin/stable/${pkgver}/妙手.20261016004642.dmg"
  "electron-v${_electron}-linux-x64.zip::https://github.com/electron/electron/releases/download/v${_electron}/electron-v${_electron}-linux-x64.zip"
  "node-v${_electron}-headers.tar.gz::https://artifacts.electronjs.org/headers/dist/v${_electron}/node-v${_electron}-headers.tar.gz"
  "node-v${_node}-linux-x64.tar.gz::https://nodejs.org/dist/v${_node}/node-v${_node}-linux-x64.tar.gz"
  "cpython-${_python}-linux-x64-install_only.tar.gz::https://github.com/astral-sh/python-build-standalone/releases/download/20260807/cpython-${_python}%2B20260807-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"
  'node-pty-1.1.0.tgz::https://registry.npmjs.org/node-pty/-/node-pty-1.1.0.tgz'
  'node-addon-api-7.1.1.tgz::https://registry.npmjs.org/node-addon-api/-/node-addon-api-7.1.1.tgz'
  'bufferutil-4.1.0.tgz::https://registry.npmjs.org/bufferutil/-/bufferutil-4.1.0.tgz'
  'utf-8-validate-6.0.6.tgz::https://registry.npmjs.org/utf-8-validate/-/utf-8-validate-6.0.6.tgz'
  'better-sqlite3-v12.11.1-electron-v146-linux-x64.tar.gz::https://github.com/WiseLibs/better-sqlite3/releases/download/v12.11.1/better-sqlite3-v12.11.1-electron-v146-linux-x64.tar.gz'
  'koffi-linux-x64-3.2.0.tgz::https://registry.npmjs.org/@koromix/koffi-linux-x64/-/koffi-linux-x64-3.2.0.tgz'
  'sharp-linux-x64-0.35.2.tgz::https://registry.npmjs.org/@img/sharp-linux-x64/-/sharp-linux-x64-0.35.2.tgz'
  'sharp-libvips-linux-x64-1.3.1.tgz::https://registry.npmjs.org/@img/sharp-libvips-linux-x64/-/sharp-libvips-linux-x64-1.3.1.tgz'
  'canvas-linux-x64-gnu-1.0.8.tgz::https://registry.npmjs.org/@napi-rs/canvas-linux-x64-gnu/-/canvas-linux-x64-gnu-1.0.8.tgz'
  'wecom-cli-linux-x64-1.1.0.tgz::https://registry.npmjs.org/@wecom/cli-linux-x64/-/cli-linux-x64-1.1.0.tgz'
  'ffmpeg-linux-x64-4.1.0.tgz::https://registry.npmjs.org/@ffmpeg-installer/linux-x64/-/linux-x64-4.1.0.tgz'
  'agent-browser-linux-x64::https://github.com/vercel-labs/agent-browser/releases/download/v0.27.3/agent-browser-linux-x64'
  'catpaw-cli-linux-x64::https://s3plus.meituan.net/mcopilot-pub/cli/v1.2.0-beta.33/catpaw-cli-linux-x64'
  'convert.sh'
  'repack-asar.js'
  'patch-skill-manifests.js'
  'catpaw-cn.sh'
  'catpaw-moon.desktop'
  'catpaw-moon-16.png'
  'catpaw-moon-24.png'
  'catpaw-moon-32.png'
  'catpaw-moon-48.png'
  'catpaw-moon-64.png'
  'catpaw-moon-128.png'
  'catpaw-moon-256.png'
  'catpaw-moon-512.png'
  'DISCLAIMER'
  'LICENSE.port-scripts'
)
sha256sums=(
  '3c931da843e32128e4e3431f50231fac38f3b6f1c2a850bc9e783cc4d4deb3cf'
  '1e0b2a6d59bb8836858a24dec454c36e15a904dd1000a1053c8e36ecc44333bc'
  'b586bf9cc6352053f9e075ed06a160a42653971742fd1746e8951e6942d55879'
  '783130984963db7ba9cbd01089eaf2c2efb055c7c1693c943174b967b3050cb8'
  '506191be3ee7bd190a8834dcdc1b3bc70aab50608deccc711935aa007239cabd'
  'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
  'b10455d15a977c0cd17a1cb0eb679e03d939f8ef8d4302eb33e1f78dacc71f82'
  '19af5978088739b8baf861a95ab4a1feb69a2d30830ced707c37920591046a87'
  'f65e05feb1174937bd67b5ddb7a70d5eed314989d2bc8637e1594e1623c4a00f'
  'e2021aeed80de4f15212525e30565756aaae790e68e3229df6d1345f43803221'
  'c7f6cecb66c5ca9db08b0dd6b4f77ea52a01c45357fdd8a80c1bf2fa8382b44e'
  '347e7db22852b7718e99862a558ca57a271bc9c1810cdf23c212caeb0aa622e3'
  '61b2c772f5945683f1b315f277ac25eafa98c34fb9eaddd31342c47451d35f38'
  '05032e8d7f5197bda600d3557facb51c7799811eaf4965d9b2d4d084ec13557d'
  '8da74fecd9b89a92876e72d663dad5e436c771c91bb051d99b2eb63a1d889516'
  'b836abe532912ae6c3388dbe713952af293a3d005fc9e4d34d52f14da99dda71'
  '373f010e2f915c026f2a50b79f0676b8deace93372af43b82ce20a7737764353'
  'e83b727a0a254bda3c4d0c70af9ceb13509eea6da414b4fa5be90e5ae679066d'
  '225a5483ceb76a2985ffc31db4c5aee38408869c14fa308f33f5ff7896b72875'
  'ef50b80ae1d55a5f48c94db21cf74c3543723af4e89f85eb9d80c0900b1efdf1'
  'ffa303d2f54724e538f4696cc7e108d7b73c254e92250f1cd2a0ac583aee22a6'
  '5a7bc6a574ef7ac498c45b4e81132ac769ec7c7235b7125e705d8e14764d9367'
  '88167f36a093afafaa9fd385b8f5ac9ea3486c4d1b70091ff658adaacaeb6974'
  '1417ab53a79538a6ea2aadb15bb6828d6e499a9c9e69aa6d08fe0f886c4506b3'
  '67cdc71e790ae8990b7df87a90b37201b86f90c5c7182b8be55f05405937f188'
  '9ad1f9a0bb5d6bd3128abd29a4f1801d3739ec430d171bde95a0eda64dad5b65'
  '4d8781235ff635581788c54c01a9e2af73ca78c4ab03266d8e3b8a4b26f61751'
  '8d01a72cd4531678a5d58cbf06c4a388ef9a8c52af307ffb40574f1718e7c174'
  'eab6bad262f114544788fae5879557b004a5c1edb69ac47b44a6ced7c7b99b57'
  'b1588a93ec6e6c9f05b7a19c7a9b2ad7f3cfe8557b69bf5ce69f9e61dd97bf72'
  '3e6cf4220a141f3d42a1b3140c9abcae60ae4bb250331a18d44a944c76b8d1e9'
  '8a8c57d9a0ca52cbf9a124410d2615fbdb5942d8239d5da15f26e3d01909d06d'
  'ff3fd1025ab5883825f6bf3f062a05bce6478acba8b75d305664096167241f42'
)

# convert.sh performs its own extraction, so keep the downloaded archives intact.
noextract=(
  "catpaw-cn-${pkgver}.dmg"
  "electron-v${_electron}-linux-x64.zip"
  "node-v${_electron}-headers.tar.gz"
  "node-v${_node}-linux-x64.tar.gz"
  "cpython-${_python}-linux-x64-install_only.tar.gz"
  'node-pty-1.1.0.tgz'
  'node-addon-api-7.1.1.tgz'
  'bufferutil-4.1.0.tgz'
  'utf-8-validate-6.0.6.tgz'
  'better-sqlite3-v12.11.1-electron-v146-linux-x64.tar.gz'
  'koffi-linux-x64-3.2.0.tgz'
  'sharp-linux-x64-0.35.2.tgz'
  'sharp-libvips-linux-x64-1.3.1.tgz'
  'canvas-linux-x64-gnu-1.0.8.tgz'
  'wecom-cli-linux-x64-1.1.0.tgz'
  'ffmpeg-linux-x64-4.1.0.tgz'
  'agent-browser-linux-x64'
  'catpaw-cli-linux-x64'
)

build() {
  export APP_DMG="$srcdir/catpaw-cn-${pkgver}.dmg"
  export ELECTRON_ZIP="$srcdir/electron-v${_electron}-linux-x64.zip"
  export ELECTRON_HEADERS_TGZ="$srcdir/node-v${_electron}-headers.tar.gz"
  export NODE_TARBALL="$srcdir/node-v${_node}-linux-x64.tar.gz"
  export PYTHON_TARBALL="$srcdir/cpython-${_python}-linux-x64-install_only.tar.gz"
  export NODE_PTY_TGZ="$srcdir/node-pty-1.1.0.tgz"
  export NODE_ADDON_API_TGZ="$srcdir/node-addon-api-7.1.1.tgz"
  export BUFFERUTIL_TGZ="$srcdir/bufferutil-4.1.0.tgz"
  export UTF8_VALIDATE_TGZ="$srcdir/utf-8-validate-6.0.6.tgz"
  export BETTER_SQLITE3_TGZ="$srcdir/better-sqlite3-v12.11.1-electron-v146-linux-x64.tar.gz"
  export KOFFI_TGZ="$srcdir/koffi-linux-x64-3.2.0.tgz"
  export SHARP_TGZ="$srcdir/sharp-linux-x64-0.35.2.tgz"
  export SHARP_LIBVIPS_TGZ="$srcdir/sharp-libvips-linux-x64-1.3.1.tgz"
  export CANVAS_TGZ="$srcdir/canvas-linux-x64-gnu-1.0.8.tgz"
  export WECOM_TGZ="$srcdir/wecom-cli-linux-x64-1.1.0.tgz"
  export FFMPEG_LINUX_TGZ="$srcdir/ffmpeg-linux-x64-4.1.0.tgz"
  export CATPAW_CLI_BIN="$srcdir/catpaw-cli-linux-x64"
  export AGENT_BROWSER_BIN="$srcdir/agent-browser-linux-x64"
  export WORK_DIR="$srcdir/build-work"
  export OUT_DIR="$srcdir/app-out"
  export ELECTRON_VER="$_electron"
  export NODE_VER="$_node"
  export PYTHON_VER="$_python"

  bash "$srcdir/convert.sh"
}

package() {
  install -dm755 "$pkgdir/opt"
  cp -a "$srcdir/app-out" "$pkgdir/opt/catpaw-cn"

  install -Dm755 "$srcdir/catpaw-cn.sh" "$pkgdir/usr/bin/catpaw-cn"
  install -Dm644 "$srcdir/catpaw-moon.desktop" \
    "$pkgdir/usr/share/applications/catpaw-moon.desktop"

  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/catpaw-moon-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/catpaw-moon.png"
  done

  install -Dm644 "$srcdir/app-out/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
  install -Dm644 "$srcdir/DISCLAIMER" "$pkgdir/usr/share/licenses/$pkgname/DISCLAIMER"
  install -Dm644 "$srcdir/LICENSE.port-scripts" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.port-scripts"
}
