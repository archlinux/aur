# Maintainer: vantu5z <vantu5z@mail.ru>

pkgname=python-shell
pkgver=1.0.1
pkgrel=1
pkgdesc="A better way to run shell commands in Python."
url="https://github.com/toastdriven/shell"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://github.com/toastdriven/shell/archive/v$pkgver.tar.gz")
sha256sums=('d114d74338877a8739ede11ef5466e950c5820a93d7dd20aa96408b2e353af0c')

build() {
    cd "${srcdir}/shell-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/shell-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
