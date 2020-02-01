# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=libphutil
pkgver=2020.5
_commit=034cf7cc39940b935e83923dbb1bacbcfe645a85
pkgrel=1
pkgdesc='A collection of PHP utility classes'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('php')
makedepends=('git')
source=("git://github.com/phacility/libphutil.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$pkgname"
  cp -a $pkgname/* "$pkgdir/usr/share/php/$pkgname/"
}
