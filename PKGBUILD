# Maintainer Evgeniy Dombek <evgeniy.d@informmonitoring.ru>

pkgname=python-pysiril
pkgver=0.0.9
pkgrel=1
pkgdesc="Python package extending scripting capabilities, present natively in Siril."
url="https://siril.org/tutorials/pysiril/"
license=('custom')
source=("https://gitlab.com/free-astro/pysiril/-/archive/V0_0_9/pysiril-V0_0_9.tar.gz")
arch=('x86_64')
md5sums=('SKIP')
depends=(siril)

package() {
    cd $srcdir/pysiril-V0_0_9
    python setup.py install --root="$pkgdir/" --optimize=1
}

#vim: syntax=sh
