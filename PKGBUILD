# Maintainer: baseplate-admin <61817579+baseplate-admin@users.noreply.github.com>
pkgname=modern-colorthief
_name=modern_colorthief
pkgver=0.1.10
pkgrel=1
pkgdesc="A modern color thief"
arch=('x86_64')
url="https://github.com/baseplate-admin/modern_colorthief"
license=('MIT')
depends=('python')
makedepends=('python-installer')
conflicts=("$_name-git")
source=("https://github.com/baseplate-admin/modern_colorthief/releases/download/0.1.10/modern_colorthief-0.1.10-pp311-pypy311_pp73-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('a2df1180152a94c26a938109db3450687ac9b3abfce6a422f5f07dff4e293900')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
