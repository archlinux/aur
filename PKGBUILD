# Maintainer: Yann Leprince <yann dot leprince at ylep dot fr>
pkgname=ttf-free3of9
pkgver=1
pkgrel=1
pkgdesc='Font for 3 of 9 barcodes (sometimes called code 39)'
arch=('any')
url='http://www.squaregear.net/fonts/'
license=('custom:Expat')
source=('http://www.squaregear.net/fonts/free3of9.zip')
md5sums=('1de33e88ea27445e32921bfbaae8919b')

package() {
  install -pDt "$pkgdir/usr/share/fonts/" free3of9.ttf fre3of9x.ttf
  install -pDt "$pkgdir/usr/share/licenses/$pkgname/" free3of9.txt license.txt
}
