# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=starseed-pilgrim-hib
pkgver=1.0
pkgrel=1
pkgdesc="A game about tending a symphonic garden, exploring space and embracing fate."
url="http://www.starseedpilgrim.com/"
license=('custom: commercial')
arch=('any')
depends=('adobe-air')
source=("hib://Starseed_Pilgrim_linux.air"
        "$pkgname.sh")
sha256sums=('51dd2c7a5dd367c667414c63ea50d10aba8f1224ca6227a0102e1f5742f2ed18'
            '07adfe310dbbf04eed1253621d19f0cde71d17e358bf3ee786d28a5e831972d0')
noextract=("Starseed_Pilgrim_linux.air")

package() {
  install -Dm644 Starseed_Pilgrim_linux.air "$pkgdir"/usr/share/starseed-pilgrim/Starseed_Pilgrim.air
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/starseed-pilgrim
}
