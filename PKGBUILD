# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>
_pkgbase=rethinkdb
pkgname=python-$_pkgbase
pkgver=2.4.6
pkgrel=2
pkgdesc="Python driver for rethinkdb"
arch=('any')
url="https://github.com/rethinkdb/rethinkdb-python"
license=('LGPL')
depends=('python')
makedepends=('python-pip')
source=()


package() {
  pip install $_pkgbase==$pkgver --isolated --root "$pkgdir" --ignore-installed --no-deps --no-warn-script-location
}
