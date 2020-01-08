# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=libphutil
pkgver=2019.39
_commit=1750586fdc50a6cd98adba4aa2f5a7649bd91dbe
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
