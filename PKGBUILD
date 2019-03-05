# $Id$
# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>
pkgname="mkdocs-material"
pkgver=4.0.2
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments" "pymdown-extensions")
makedepends=("python-setuptools")
source=("https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
sha256sums=('d0bf5ef20219dfce507546dc79a324cabdb12a88b385cf486b9435b5c7a8e51a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
