# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=ttf-hymmnos-ar
pkgver=1.0.1
pkgrel=1
pkgdesc="Hymmnos and Ar-ciela fonts from the Ar Tonelico Series"
arch=('any')
url="http://hymmnoserver.uguu.ca/"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings')
source=('hymmnos.ttf' 'ar-ciela_compartment.ttf')
md5sums=('a1c83206ddc8bea62b9c917fb66d9579' '6b3aecd0c365cfbc58b613747bc254b9')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" hymmnos.ttf
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" ar-ciela_compartment.ttf
}

