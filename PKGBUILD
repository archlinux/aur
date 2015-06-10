# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

pkgname=python2-bugzilla
_pkgname=python-bugzilla
pkgver=1.2.0
pkgrel=1
pkgdesc="Bugzilla XMLRPC access module"
arch=(any)
url="https://fedorahosted.org/python-bugzilla/"
license=(GPL2)
depends=("python2")
makedepends=("python2-distribute")
source=("https://fedorahosted.org/releases/p/y/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('628f6d803054608a5b6187ae8239f7ed')
