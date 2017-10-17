# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname="pymdown-extensions"
pkgver=4.1.0
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=("any")
url="http://facelessuser.github.io/pymdown-extensions/"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/facelessuser/pymdown-extensions/archive/${pkgver}.tar.gz")
sha256sums=('3b5f09c9f991bb242381466c9b5fea09000a6afa91e5fb8dbe8705cb85fe3b1e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
