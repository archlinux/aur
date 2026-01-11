# Maintainer: baseplate-admin <61817579+baseplate-admin@users.noreply.github.com>
pkgname=modern-colorthief
_name=modern_colorthief
pkgver=0.1.9
pkgrel=1
pkgdesc="A modern color thief"
arch=('x86_64')
url="https://github.com/baseplate-admin/modern_colorthief"
license=('MIT')
depends=('python')
makedepends=('python-installer')
conflicts=("$_name-git")
source=("https://github.com/baseplate-admin/modern_colorthief/releases/download/0.1.9/modern_colorthief-0.1.9-pp311-pypy311_pp73-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('de28fa0934f61ec8e2f3c7f8a8bc0cb29c3df239d08c6286d54a5c959172df69')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
