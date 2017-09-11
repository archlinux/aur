# Maintainer: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=leather
pkgname=python-$_pkgname
pkgver=0.3.3
pkgrel=1
pkgdesc="Python charting for 80% of humans."
arch=("any")
url="https://leather.readthedocs.io/"
license=("MIT")
depends=("python"
         "python-six")
makedepends=("python-setuptools")
source=("https://github.com/wireservice/leather/archive/${pkgver}.tar.gz")
sha256sums=('70f621f7c5ddac6bc3261850134c0187cb200844243eb878a29f8a8f15a8db46')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
