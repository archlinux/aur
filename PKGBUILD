# $Id$
# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Maintainer: David Birks <david@tellus.space>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>
pkgname="mkdocs-material"
pkgver=4.1.0
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments" "pymdown-extensions")
makedepends=("python-setuptools")
source=("https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
sha256sums=('948732f6494ff2859915948d534cc2e1d43ddcfff7e63e8e7bc1524af794d778')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
