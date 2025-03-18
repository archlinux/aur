# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
pkgname=python-earcut
_pkgname=earcut
pkgver=1.15
pkgrel=1
pkgdesc="A pure Python port of the earcut JS triangulation library"
arch=('any')
url="https://pypi.org/project/$_pkgname/"
license=('ISC')
depends=('python' 'python-pip')
makedepends=('python-setuptools')
#source=()
#sha256sums=()

package() {
    pip install --root="$pkgdir" --prefix=/usr --no-warn-script-location $_pkgname
}
