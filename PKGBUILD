# Maintainer: mensylisir <710080675@qq.com>

pkgname=catpaw
pkgver=2026.0929.1948
pkgrel=3
_electron=42.11.2
_node=24.18.0
_python=3.12.13
pkgdesc='CatPaw AI Agent 桌面应用（国际版），非官方 Linux 移植'
arch=('x86_64')
url='https://catpaw.com/'
license=('custom')
depends=(
  'gtk3' 'nss' 'alsa-lib' 'libcups' 'libdrm' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi'
  'libxkbcommon' 'libxrandr' 'mesa' 'libsecret'
  'libappindicator' 'libpulse' 'json-glib' 'wayland' 'systemd-libs' 'dbus'
  'libnotify'
)
makedepends=('unzip' 'nodejs' 'node-gyp' 'python' 'gcc' 'make')
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
  "catpaw-${pkgver}.exe::https://s3-fra01-eu.mykeeta.net/catpaw-overseas/ide/win32-x64/stable/${pkgver}/17906831719554905511_CatPaw-overseas-${pkgver}-x64.exe"
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
  'agent-browser-0.38.1.tgz::https://registry.npmjs.org/agent-browser/-/agent-browser-0.38.1.tgz'
  'catpaw-cli-linux-x64-1.2.0-beta.19::https://s3plus.meituan.net/mcopilot-pub/cli/v1.2.0-beta.19/catpaw-cli-linux-x64'
  'convert.sh'
  'repack-asar.js'
  'patch-overlay-window.js'
  'patch-skill-manifests.js'
  'catpaw.sh'
  'catpaw-overseas.desktop'
  'catpaw-overseas-16.png'
  'catpaw-overseas-24.png'
  'catpaw-overseas-32.png'
  'catpaw-overseas-48.png'
  'catpaw-overseas-64.png'
  'catpaw-overseas-128.png'
  'catpaw-overseas-256.png'
  'catpaw-overseas-512.png'
  'DISCLAIMER'
  'LICENSE.port-scripts'
  # innoextract: upstream (dscharrer) stopped at 1.9 and cannot read Inno Setup
  # 6.4 installers; Arch only packages 1.9. crazy-max publishes static Linux
  # builds of the updated fork: version-pinned, sha256-verified, build-time
  # only (never shipped in the package).
  'innoextract-linux-amd64::https://github.com/crazy-max/innoextract/releases/download/v1.13.0/innoextract-linux-amd64'
)
sha256sums=(
  'd5767b1b2ecbd83bf7f5d657d6dee30ad2ca63ab497e8d019a25daf3e6e98a17'
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
  '89a7df4761ff335e4dd5367e4cf04cecb9ba4e2cc130a0220f798d188414dc6c'
  '2bf84853274ce6b39f3c363d5ed00573ad5ea99796c362dbb2c9a5e2be669c9c'
  'e0836baacc6c50e1ed0e346a8d0e8b9c1211924eedd9332df99383b65c56c910'
  'ef50b80ae1d55a5f48c94db21cf74c3543723af4e89f85eb9d80c0900b1efdf1'
  'f3e0d720d575cb6521f639754157d86b7aed60b993bc62708b99ac37ae8e1248'
  'ffa303d2f54724e538f4696cc7e108d7b73c254e92250f1cd2a0ac583aee22a6'
  '8b7c70e7c9381857ef57b06adfe3abbaef16abc1ddc1bfe33ad403db742f657f'
  'c9e8109a3657b04261796d3882f29819853b63ce13ccc8f31feadb0d5ca3f2d1'
  'a8c72cd2b5888c6453fa177705d4de2fbc29123a2e0a990fa973d7bc10770946'
  'c5951f2307091fbb71e91cd5c804c812f2ba7dc496c9de7454fed198c2499126'
  'b0ac8580c89f088ec18b8dbbc77394c73d62951fa2f9421f2d2220ad86916f46'
  '2a7f6c99a0a500676bcf1a1237d3fae21758480d900c4282254713445b8540f1'
  '6710e29719ec0a6a883f9c2171db22ad03e0352baa7775d32ad22a49596a156f'
  '10f534ee8b8f271fd9cddb06498a6cf45ad7b738532eeb55a174569bd56b1c0e'
  'c9615ae3202896f95c31b3a707338f6d8e658be7d5a807b557e3873257385b46'
  'b87d064dc688195aa21741a25db5468bfd1449d48e6647986667f47ad4b6bb60'
  'c1cbc22e34b5109d993beda70d5fa3c776a958a2fa3872d895f4668515671b31'
  '315ac7033d47f8bb9c58fa42c1956b59d7654da7dc7b9790c3d5b4749538fe60'
  'c898db2ecc282ff8d943e9868d03dd6f1fc6069ddd40430341b211f93826b360'
)

# convert.sh performs its own extraction, so keep the downloaded archives intact.
noextract=(
  "catpaw-${pkgver}.exe"
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
  'agent-browser-0.38.1.tgz'
  'catpaw-cli-linux-x64-1.2.0-beta.19'
)

build() {
  export APP_EXE="$srcdir/catpaw-${pkgver}.exe"
  export INNOEXTRACT="$srcdir/innoextract-linux-amd64"
  chmod 755 "$INNOEXTRACT"
  export PATH="$(dirname "$INNOEXTRACT"):$PATH"
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
  export CATPAW_CLI_BIN="$srcdir/catpaw-cli-linux-x64-1.2.0-beta.19"
  export AGENT_BROWSER_TGZ="$srcdir/agent-browser-0.38.1.tgz"
  export WORK_DIR="$srcdir/build-work"
  export OUT_DIR="$srcdir/app-out"
  export ELECTRON_VER="$_electron"
  export NODE_VER="$_node"
  export PYTHON_VER="$_python"
  export APP_NAME="catpaw"
  export APP_ID="com.catx.catpaw.overseas"
  export DISPLAY_NAME="CatPaw"

  bash "$srcdir/convert.sh"
}

package() {
  install -dm755 "$pkgdir/opt"
  cp -a "$srcdir/app-out" "$pkgdir/opt/catpaw"

  install -Dm755 "$srcdir/catpaw.sh" "$pkgdir/usr/bin/catpaw"
  install -Dm644 "$srcdir/catpaw-overseas.desktop" \
    "$pkgdir/usr/share/applications/catpaw-overseas.desktop"

  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/catpaw-overseas-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/catpaw-overseas.png"
  done

  install -Dm644 "$srcdir/app-out/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
  install -Dm644 "$srcdir/DISCLAIMER" "$pkgdir/usr/share/licenses/$pkgname/DISCLAIMER"
  install -Dm644 "$srcdir/LICENSE.port-scripts" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.port-scripts"
}
