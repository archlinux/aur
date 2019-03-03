# Maintainer: Teddy Valette (kyominii) <teddy.valette@telecomnancy.net>
# From : https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts

pkgname=san-francisco-pro-fonts
pkgver=1.0
pkgrel=1
pkgdesc="San Francisco Pro Fonts by Apple"
url="https://developer.apple.com/fonts/"
arch=(any)
license=(custom)
_tarname=San-Francisco-Pro-Fonts-$pkgver
source=("$_tarname.tar.gz::https://github.com/Kyominii/San-Francisco-Pro-Fonts/archive/$pkgver.tar.gz")
sha256sums=('81673c001f136e8dab5a3751c527a2256318483a137b1aceba0fe60c3559c10b')

package() {
  cd $_tarname
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.otf
}
