# Maintainer: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=cubes
pkgname=python-$_pkgname
pkgver=1.1
pkgrel=2
pkgdesc="Lightweight framework for Online Analytical Processing (OLAP) and multidimensional analysis"
arch=("any")
url="http://cubes.databrewery.org/"
license=("custom")
depends=("python"
         "python-dateutil"
         "python-jsonschema"
         "python-expressions"
         "python-grako"
         "python-click")
makedepends=("python-setuptools")
source=("https://github.com/databrewery/cubes/archive/v${pkgver}.tar.gz")
sha256sums=('a5161aee882259702bfa3261d29c7d559bd38a857d67b9d2a5c950904d3e576b')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
