# Maintainer: Meir Kriheli <mkriheli@gmail.com>
# Contributor:

pkgname=python-binaryornot
_pkgname=binaryornot
pkgver=0.4.4
pkgrel=1
pkgdesc="Ultra-lightweight pure Python package to check if a file is binary or text"
arch=('any')
url="https://github.com/audreyr/binaryornot"
license=('BSD')
groups=('devel')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/audreyr/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=("aff341cdc4067a97ee947a3851721818")

package() {
      cd "$srcdir/${_pkgname}-${pkgver}"
      python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
