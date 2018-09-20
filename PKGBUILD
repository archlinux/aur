# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=libphutil
pkgver=2018.37
_commit=014e3569b2e01056e69e4c51c2c40b14e3059091
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

