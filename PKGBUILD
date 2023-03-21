# Maintainer Evgeniy Dombek <edombek@yandex.ru>

pkgname=python-pysiril
pkgver=0.0.14
_ver=0_0_14
pkgrel=1
pkgdesc="Python package extending scripting capabilities, present natively in Siril."
url="https://siril.org/tutorials/pysiril/"
license=('custom')
source=("https://gitlab.com/free-astro/pysiril/-/archive/V$_ver/pysiril-V$_ver.tar.gz")
arch=('x86_64')
sha256sums=('44c46e691d6423c76fa59486ac7805bb111975c3bf4da928e35ee6cd86c3e01c')
depends=(siril)

package() {
    cd $srcdir/pysiril-V$_ver
    python setup.py install --root="$pkgdir/" --optimize=1
}

#vim: syntax=sh
