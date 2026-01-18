pkgname=ttf-monolisa-font
pkgver=1.0
pkgrel=1
pkgdesc="MonoLisa TrueType font, must own the fonts"
arch=('any')
url="https://www.monolisa.dev/"
license=('FaceType - EULA')
depends=(
  'fontconfig'
  'ttf-nerd-fonts-symbols'
)
source=('monolisa-fonts.tar.gz')
sha256sums=('SKIP')
install=monolisa-font.install
package() {
  install -d "$pkgdir/usr/share/fonts/TTF/MonoLisa"

  install -m644 ttf/*.ttf \
    "$pkgdir/usr/share/fonts/TTF/MonoLisa/"
}
