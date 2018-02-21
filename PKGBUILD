# $Id$
# Maintainer: Abuzer Rafey <arafey@vyvygen.org>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
pkgname="mkdocs-material"
pkgver=2.6.3
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments" "pymdown-extensions")
makedepends=("python-setuptools")
source=("https://github.com/squidfunk/mkdocs-material/archive/${pkgver}.tar.gz")
sha256sums=('13931b39657fdf991181d2378062acb8811bae8e29f1bd3229e5c3028ff77340')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
