# Contributor: ShadowKyogre <shadowkyogre.public@gmail.com>
pkgname=ttf-futhark-adapted
pkgver=1.0
pkgrel=1
pkgdesc="The Elder Futhark adapted to the characteristics of today's computers."
arch=('any')
url="http://openfontlibrary.org/font/futhark-adapted"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=futhark-adapted.install
source=("http://openfontlibrary.org/assets/downloads/futhark-adapted/5c02df4a239c746506a3acdb36f815ad/futhark-adapted.zip")

package () {
  cd "$srcdir"
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
md5sums=('5c02df4a239c746506a3acdb36f815ad')
