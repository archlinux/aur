pkgname=ascii-patrol
pkgver=1.2
pkgrel=1
pkgdesc='Terminal Moon Control clone.'
arch=('x86_64')
url='http://ascii-patrol.com/'
license=('GPL')
source=(http://ascii-patrol.com/area51/ascii-patrol-debian-x64.tgz)
md5sums=('cb46bbdc71715091d9e87ebd65564f7d')

package() {
  install -m755 -D ${srcdir}/asciipat $pkgdir/usr/bin/$pkgname
}
