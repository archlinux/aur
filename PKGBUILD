pkgname=ascii-patrol
pkgver=1.3
pkgrel=1
pkgdesc='Terminal Moon Control clone.'
arch=('x86_64')
url='http://ascii-patrol.com/'
license=('GPL')
source=(http://ascii-patrol.com/area51/ascii-patrol-debian-x64.tgz)
md5sums=('f3ecfcff60862e5c23131876876e4db6')

package() {
  install -m755 -D ${srcdir}/asciipat/asciipat $pkgdir/usr/bin/$pkgname
}
