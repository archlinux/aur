# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ubelt
_pkgname=ubelt
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python utility belt containing simple tools"
arch=('any')
url="https://github.com/Erotemic/ubelt"
license=('Apache2')
depends=('python' 'python-ordered-set')
optdepends=()
makedepends=('python-setuptools')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('cc94626ea111f554f9cbdc8dede6cf83ec1f58ca1c49648d513022be05ba8a93')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}


### vim:ts=2:sw=2:et:
