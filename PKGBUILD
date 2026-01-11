# Maintainer: baseplate-admin <61817579+baseplate-admin@users.noreply.github.com>
pkgname=modern-colorthief
_name=modern_colorthief
pkgver=0.1.11
pkgrel=1
pkgdesc="A modern color thief"
arch=('x86_64')
url="https://github.com/baseplate-admin/modern_colorthief"
license=('MIT')
depends=('python')
makedepends=('python-installer')
conflicts=("$_name-git")
source=("https://github.com/baseplate-admin/modern_colorthief/releases/download/0.1.11/modern_colorthief-0.1.11-pp311-pypy311_pp73-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('8a02595cbd034c5f0be855af984b8a153c9ad3b7a89188bf73f34d47f61f4cec')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
