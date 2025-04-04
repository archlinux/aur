# Maintainer: Jujstme <just.tribe at gmail dot com>

pkgname=unleashedrecomp-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="An unofficial PC port of the Xbox 360 version of Sonic Unleashed created through the process of static recompilation"
arch=('x86_64')
url="https://github.com/Jujstme/UnleashedRecomp"
license=('GPL3')
depends=(
  'gtk3'
  'glib2'
  'pango'
  'harfbuzz'
  'cairo'
  'pixman'
  'libx11'
  'libxext'
  'gcc-libs'
  'glibc'
  'zlib'
  'freetype2'
  'fontconfig'
  'vulkan-driver'
)
optdepends=(
  'wayland: Wayland support'
)
provides=('unleashedrecomp')
source=(
  "https://github.com/Jujstme/UnleashedRecomp/releases/download/1.0.3-1/UnleashedRecomp-1.0.3-1.zip"
  "https://raw.githubusercontent.com/hedge-dev/UnleashedRecompResources/e5a4adccb30734321ac17347090abeb6690dab70/images/game_icon.png"
  "io.github.hedge_dev.unleashedrecomp.desktop"
)
sha256sums=(
  'f35672448f57fe94d407e945b5dcd7ef9f85efb754f74992570efe7bcfeaf852'
  '6d9fe76d8e6573acf537388bde3cc1495d2920dc350950186581c80e83faf42d'
  '240e4787823422d32417f2b0b939ca34f9f35444891d1be2998f4297cf528911'
)

package() {
  install -Dm755 "UnleashedRecomp" "${pkgdir}/usr/bin/UnleashedRecomp"
  install -Dm644 "io.github.hedge_dev.unleashedrecomp.desktop" "${pkgdir}/usr/share/applications/io.github.hedge_dev.unleashedrecomp.desktop"
  install -Dm644 "game_icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.hedge_dev.unleashedrecomp.png"
}
