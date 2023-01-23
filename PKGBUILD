# Maintainer: Pellegrino Prevete <pellegrinoprevete at gmail dot com>

_pkg="pytchat"
pkgname="python-${_pkg}"
pkgver=0.5.5
pkgrel=1
pkgdesc="Python library for fetching youtube live chat."
arch=('any')
_host="https://github.com"
_ns="taizan-hokuto"
url="${_host}/${_ns}/${_pkg}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools') #  'python-distutils-extra')
conflicts=()
options=(!emptydirs)
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f066b6322f1162b2395db397e6a0b8ec951bde6350a242abbffa00c9e456a9fb99f01b924dfcd89e77af9ba51ed728321ed90cb41c242b19c9b3fe374c4698ac')

package() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
