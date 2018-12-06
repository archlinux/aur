# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname="pymdown-extensions"
pkgver=6.0.0
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=("any")
url="http://facelessuser.github.io/pymdown-extensions/"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/facelessuser/pymdown-extensions/archive/${pkgver}.tar.gz")
sha256sums=('33130e8bd4a21753b3b05b5e19fb7cbdadd41b1b84ae7cca135a207419892d09')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
