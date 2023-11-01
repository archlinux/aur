# Maintainer Evgeniy Dombek <edombek@yandex.ru>

pkgname=python-pysiril
pkgver=0.0.17
_ver=0_0_17
pkgrel=1
pkgdesc="Python package extending scripting capabilities, present natively in Siril."
url="https://siril.org/tutorials/pysiril/"
license=('custom')
source=("https://gitlab.com/free-astro/pysiril/-/archive/V$_ver/pysiril-V$_ver.tar.gz")
arch=('x86_64')
sha256sums=('bbe38da339a2ea0c1944c05f5e912ca6224ab56b6d3f3fe469b17046bd21d9b1')
depends=(siril)

package() {
    cd $srcdir/pysiril-V$_ver
    python setup.py install --root="$pkgdir/" --optimize=1
}

#vim: syntax=sh
