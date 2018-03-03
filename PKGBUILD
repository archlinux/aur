# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname="pymdown-extensions"
pkgver=4.8.0
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=("any")
url="http://facelessuser.github.io/pymdown-extensions/"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/facelessuser/pymdown-extensions/archive/${pkgver}.tar.gz")
sha256sums=('00ba111fb1283dee3f15abeacc011407ba3938d4c209c0a2111a5f8bda7e944e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
