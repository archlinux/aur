# Maintainer Evgeniy Dombek <edombek@yandex.ru>

pkgname=python-pysiril
pkgver=0.0.13
_ver=0_0_13
pkgrel=1
pkgdesc="Python package extending scripting capabilities, present natively in Siril."
url="https://siril.org/tutorials/pysiril/"
license=('custom')
source=("https://gitlab.com/free-astro/pysiril/-/archive/V$_ver/pysiril-V$_ver.tar.gz")
arch=('x86_64')
sha256sums=('59b77d1fd61a1297d33f8ec674360cdeb44aa151b9e24d4c9405f9f2dd903bd6')
depends=(siril)

package() {
    cd $srcdir/pysiril-V$_ver
    python setup.py install --root="$pkgdir/" --optimize=1
}

#vim: syntax=sh
