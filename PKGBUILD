# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=pymdown-extensions
pkgver=6.3.0
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=("any")
url="http://facelessuser.github.io/pymdown-extensions/"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/facelessuser/pymdown-extensions/archive/${pkgver}.tar.gz")
sha256sums=('9e2f98bbc31c76cfd0001b58c45b1a8add66d279f289f5c5b850778a4e771c22')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
