# $Id$
# Maintainer: Abuzer Rafey <arafey@vyvygen.org>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
pkgname="mkdocs-material"
pkgver=1.12.0
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments" "pymdown-extensions")
makedepends=("python-setuptools")
source=("https://github.com/squidfunk/mkdocs-material/archive/${pkgver}.tar.gz")
sha256sums=('fb4634d2fffbdc841c1f5687726a2777d8955b84e644ab0482d894c06a4f3c88')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
