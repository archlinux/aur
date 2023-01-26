# Maintainer Evgeniy Dombek <edombek@yandex.ru>

pkgname=python-pysiril
pkgver=0.0.12
pkgrel=2
pkgdesc="Python package extending scripting capabilities, present natively in Siril."
url="https://siril.org/tutorials/pysiril/"
license=('custom')
source=("https://gitlab.com/free-astro/pysiril/-/archive/V0_0_12/pysiril-V0_0_12.tar.gz")
arch=('x86_64')
sha256sums=('951cfbc38a5df80c0c8cc2efa2ec2de8b41478e67cfb049aa78402dd7336916c')
depends=(siril)

package() {
    cd $srcdir/pysiril-V0_0_12
    python setup.py install --root="$pkgdir/" --optimize=1
}

#vim: syntax=sh
