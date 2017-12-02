# $Id$
# Maintainer: Abuzer Rafey <arafey@vyvygen.org>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
pkgname="mkdocs-material"
pkgver=2.2.1
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments" "pymdown-extensions")
makedepends=("python-setuptools")
source=("https://github.com/squidfunk/mkdocs-material/archive/${pkgver}.tar.gz")
sha256sums=('fdc88f382f486d29141726b7e16de6911cbe6ed81a6d22d05abfe799573add9d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
