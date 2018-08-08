# Maintainer: Darshit Shah <darnir@gmail.com>

_python=python
_name=ansicolor

pkgname=$_python-ansicolor
pkgver=0.2.6
pkgrel=4
pkgdesc="A library to produce ansi color output and colored highlighting and diffing"
depends=('python')
makedepends=('python-setuptools')
arch=('any')
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('69ce8352b7089de6fd8b8e03cc557d48')
url="https://github.com/numerodix/ansicolor"
license=('Apache')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    $_python setup.py install --root="$pkgdir" --optimize=1
}
