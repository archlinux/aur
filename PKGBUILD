# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8
pkgver=1.0
pkgrel=2
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use."
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-8.otf")
sha512sums=('b8d0b1e82c47d6d84705cc376d2c83193f81145f5562dce473dd3826d5587a172cedb063dfe731428c66a186b94267631792ad5b6e3500481f4414981c7ef08f')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8.otf"
}

# vim:set ts=2 sw=2 et:
