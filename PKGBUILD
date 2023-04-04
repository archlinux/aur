# Maintainer Evgeniy Dombek <edombek@yandex.ru>

pkgname=python-pysiril
pkgver=0.0.15
_ver=0_0_15
pkgrel=1
pkgdesc="Python package extending scripting capabilities, present natively in Siril."
url="https://siril.org/tutorials/pysiril/"
license=('custom')
source=("https://gitlab.com/free-astro/pysiril/-/archive/V$_ver/pysiril-V$_ver.tar.gz")
arch=('x86_64')
sha256sums=('c6117218dad305a33cde4d6590938830f64fc9c8c6fef53646c000eb34b8c4bc')
depends=(siril)

package() {
    cd $srcdir/pysiril-V$_ver
    python setup.py install --root="$pkgdir/" --optimize=1
}

#vim: syntax=sh
