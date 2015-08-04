# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=otf-cm-unicode
_pkgname=cm-unicode
pkgver=0.7.0
pkgrel=2
pkgdesc="A font family converted from D. Knuth's Computer Modern metafont."
arch=('any')
url="http://canopus.iacp.dvo.ru/~panov/cm-unicode/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=cm-unicode.install
source=("http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver-otf.tar.xz")
md5sums=('8503cc1316103d97a668a9efa71d0e3c')

build() {
  /bin/true
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
