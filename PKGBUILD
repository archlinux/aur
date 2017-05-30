# Maintainer: Achilleas Pipinellis <axilleas archlinux.info>

pkgname=python2-bugzilla
_pkgname=python-bugzilla
pkgver=2.1.0
pkgrel=1
pkgdesc="Bugzilla XMLRPC access module"
arch=(any)
url="https://github.com/python-bugzilla/python-bugzilla"
license=(GPL2)
depends=("python2")
makedepends=("python2-distribute")
source=("https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('27f71931c17ceb6553b2562429994515')
