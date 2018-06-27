# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname="pymdown-extensions"
pkgver=4.11.0
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=("any")
url="http://facelessuser.github.io/pymdown-extensions/"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/facelessuser/pymdown-extensions/archive/${pkgver}.tar.gz")
sha256sums=('7b2869b8cf182eb05e836952a01e3c9388ccbd5dae527d8a4d41ca6c6a61f8c0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
