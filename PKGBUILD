# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=dollz
pkgver=3.0
pkgrel=1
pkgdesc='Gamecube executable compressor'
arch=('x86_64' 'i686')
url='http://wiibrew.org/wiki/Dollz'
license=('custom: freeware')
depends=('lib32-glibc')
[ "$CARCH" == "i686" ] && depends=('glibc')
options=(!strip)
source=("http://wiibrew.org/w/images/e/ef/Dollz3.zip")
sha256sums=('1bf206b36ba15aa4977c0f7e7d037bbbad2c45b5aa0dcd3790ce26f8cac0b65a')

package() {
  install -Dm755 dollz3/dollz3 "$pkgdir"/usr/bin/dollz
  install -Dm644 dollz3/dollz3.txt "$pkgdir"/usr/share/doc/dollz/dollz3.txt
}
