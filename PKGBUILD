# Maintainer: Nicolás Demarchi <mail@gilgamezh.me>

pkgname=fades
pkgver=6.0
pkgrel=1
pkgdesc="FAst DEpendencies for Scripts."
url="https://github.com/PyAr/fades/"
arch=('any')
depends=('python' 'python-setuptools')
optdepends=('python-xdg: Used to correctly get user folders', 'python-virtualenv: Used to support different Python versions for child execution.')
license=('GPL3')
source=(https://pypi.python.org/packages/59/18/cc80eb5c0a2e15c4b95df6a3c6158e06acb2e075ef2b811753936a6bdf57/fades-6.0.1.tar.gz)
md5sums=('791913189e5a1a987ff6f9f4b2905e37')

build() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
