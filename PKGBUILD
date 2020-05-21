_pkgbase=rethinkdb
pkgname=python-$_pkgbase
pkgver=2.4.6
pkgrel=1
pkgdesc="Python driver for rethinkdb"
arch=('any')
url="https://github.com/PyCQA/astroid"
license=('LGPL')
depends=('python')
makedepends=('python-pip')
source=()


package() {
  pip install $_pkgbase==$pkgver --isolated --root "$pkgdir" --ignore-installed --no-deps --no-warn-script-location
}
