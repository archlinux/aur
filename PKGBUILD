# Maintainer: Jujstme <just.tribe at gmail dot com>

pkgname=unleashedrecomp-bin
pkgver=1.0.2
pkgrel=3
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
  "https://github.com/Jujstme/UnleashedRecomp/releases/download/1.0.2/UnleashedRecomp.zip"
  "https://raw.githubusercontent.com/hedge-dev/UnleashedRecompResources/e5a4adccb30734321ac17347090abeb6690dab70/images/game_icon.png"
  "io.github.hedge_dev.unleashedrecomp.desktop"
)
sha256sums=(
  '820ef41d7ae3ef2d8bf0a34c981aebad3ce7c578bfcb99bbf564dc64e98e5e47'
  '6d9fe76d8e6573acf537388bde3cc1495d2920dc350950186581c80e83faf42d'
  'b2c95666db3991f2a21f4e52adf54eea7ada4edb72258c6dab6d91fb316cb77a'
)

package() {
  install -Dm755 "UnleashedRecomp" "${pkgdir}/usr/bin/UnleashedRecomp"
  install -Dm644 "io.github.hedge_dev.unleashedrecomp.desktop" "${pkgdir}/usr/share/applications/io.github.hedge_dev.unleashedrecomp.desktop"
  install -Dm644 "game_icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.hedge_dev.unleashedrecomp.png"
}
