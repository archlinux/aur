# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=sys
pkgver=0.1
pkgrel=2
pkgdesc='Friendly systemctl wrapper'
arch=('any')
url='http://github.com/xyproto/sys/'
license=('GPL2')
depends=('bash' 'sudo')
source=("git://github.com/xyproto/sys.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
