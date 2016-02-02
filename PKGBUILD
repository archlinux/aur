# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8-thin
pkgver=1.0
pkgrel=1
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use. Based on system fonts with 1-pixel-wide lines."
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-8-thin.otf")
sha512sums=('89cfa2e806a444888002137b295d9193947376ee442db7b002e1cd29b01f4125b7c17dea22c92b327d07af25c65b58c4cf691a4129c86ff7d50c72f76c95a529')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8-thin.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8-thin.otf"
}

# vim:set ts=2 sw=2 et:
