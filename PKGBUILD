# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=pymdown-extensions
pkgver=6.2.0
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=("any")
url="http://facelessuser.github.io/pymdown-extensions/"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/facelessuser/pymdown-extensions/archive/${pkgver}.tar.gz")
sha256sums=('0eb03c0842780e5039c147dff755262effce37710d8016707f6bdd091d85c630')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
