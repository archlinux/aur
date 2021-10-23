# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-sphinx-reredirects
pkgver=0.0.0
pkgrel=1
pkgdesc="Handles redirects for moved pages in Sphinx documentation projects"
arch=("any")
url="https://gitlab.com/documatt/sphinx-reredirects"
license=("BSD")
depends=("python" "python-sphinx")
makedepends=("python-setuptools" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/documatt/sphinx-reredirects/-/archive/v0.0.0/sphinx-reredirects-v${pkgver}.tar.gz")
sha256sums=("2d1074ccc9122a8ff878599b48555880013262f833a51ed380d186e7dce39e78")

package() {
    cd "sphinx-reredirects-v${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
