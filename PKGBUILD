# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=libphutil
pkgver=2019.20
_commit=1185300a23d9b0a611ecaf8c99e90c92097f5c67
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
