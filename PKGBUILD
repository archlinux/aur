# Maintainer: Darshit Shah <darnir@gmail.com>

_python=python
_name=ansicolor

pkgname=$_python-ansicolor
pkgver=0.2.4
pkgrel=1
pkgdesc="A library to produce ansi color output and colored highlighting and diffing"
depends=('python')
arch=('any')
source=("http://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('8df97790932c189ca639b5241932bd49')
url="https://github.com/numerodix/ansicolor"
license=('Apache')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    $_python setup.py install --root="$pkgdir" --optimize=1
}
