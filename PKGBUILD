# $Id$
# Maintainer: Abuzer Rafey <arafey@vyvygen.org>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
pkgname="mkdocs-material"
pkgver=1.10.3
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments")
makedepends=("python-setuptools")
source=("https://github.com/squidfunk/mkdocs-material/archive/${pkgver}.tar.gz")
sha256sums=('c42b105d4c42af0536ed3ae4507cbef01e08008dd258c4bf26ce1c73bf302e9c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
