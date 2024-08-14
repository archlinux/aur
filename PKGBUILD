# Maintainer: Tomasz Bursztyka <tomasz dot bursztyka at proton dot me>

pkgname=python-pyqt-distutils
pkgver=0.7.3
pkgrel=1
pkgdesc="A set of distutils extension to work with PyQt applications and UI files."
arch=("any")
url="https://github.com/ColinDuquesnoy/pyqt_distutils"
license=("MIT")
depends=("docopt")
makedepends=("python-setuptools")
source=("https://github.com/ColinDuquesnoy/pyqt_distutils/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("9951e0a71919ab2d047625796904815f471b2239520c3041e16c9b07b956d0ae")

build() {
    cd "pyqt_distutils-${pkgver}"
    python setup.py build
}

package() {
    cd "pyqt_distutils-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
