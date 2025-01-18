# Maintainer: juanvel400 <juanvel400@proton.me>
pkgname=python-ueml
pkgver=0.3
pkgrel=1
pkgdesc="UEML Python Module"
arch=('any')
url="https://juanvel4000.serv00.net/ueml"
license=('MIT')
depends=('python' 'python-pip')
checkdepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/d1/f2/34d98585c6035abf4a575908834b7b6bd6593dd3cb669ba4b0b3380e66e7/ueml-0.3.tar.gz")
sha256sums=('98b11226c3c3486e6acaa4882b2e4c782cc18d287741c4cf73c44f51eab697ec')

build() {
    cd "$srcdir/ueml-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/ueml-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
