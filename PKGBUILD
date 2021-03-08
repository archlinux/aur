# Maintainer: Anatol Pomozov

pkgname=osquery-bin
pkgver=4.6.0
pkgrel=1
pkgdesc='SQL powered operating system instrumentation, monitoring, and analytics'
arch=(x86_64)
url='https://osquery.io'
license=(Apache, GPL2)
depends=(zlib)
makedepends=()
conflicts=(osquery)
provides=(osquery)
replaces=(osquery)
source=(https://pkg.osquery.io/linux/osquery-${pkgver}_1.linux_x86_64.tar.gz)
sha1sums=('b73dee6155477c26d77420387fdfd65c9cc73c0b')

package() {
  rm -r etc/init.d
  cp -r etc $pkgdir
  cp -r usr/local $pkgdir/usr
  cp -r var $pkgdir
}
