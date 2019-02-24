# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=libphutil
pkgver=2019.8
_commit=813a26a2d09758f3c407a0c99c6761f11f62cb90
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
