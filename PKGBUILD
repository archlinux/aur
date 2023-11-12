# Maintainer: Popolon <popolon@popolon.org>

modname=pyguetzli
pkgname=python-${modname}
pkgver=1.0.15
pkgrel=1
pkgdesc="Python binding for Google’s Guetzli library"
arch=('any')
url="https://github.com/wanadev/pyguetzli"
license=('Apache-2.0')
makedepends=('python-setuptools')
depends=('python')
source=("${modname}-${pkgver}.tar.gz::https://github.com/wanadev/pyguetzli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac8ed3efd59ac97af61d2b4cfd6d01f341bcad6855ffe54dffb43f0d5fc54b87')

package() {
    cd "$srcdir/${modname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
