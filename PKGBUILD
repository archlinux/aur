# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

_pkgname=txredisapi
pkgname=python-txredisapi
pkgver=1.4.7
pkgrel=1
pkgdesc="Non-blocking redis client for python twisted"
arch=('any')
url="https://github.com/IlyaSkriblovsky/txredisapi"
license=('Apache')
depends=('python' 'python-twisted' 'python-six')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")


build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
sha256sums=('e6cc43f51e35d608abdca8f8c7d20e148fe1d82679f6e584baea613ebec812bb')
