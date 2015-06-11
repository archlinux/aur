# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname='websockify-openstack'
_pkgname='websockify'
pkgver=0.5.1
pkgrel=1
pkgdesc="WebSocket to TCP proxy/bridge."
license=('LGPL3')
arch=('any')
url="http://github.com/kanaka/websockify"
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-numpy')
source=("https://github.com/kanaka/${_pkgname}/archive/v${pkgver}.tar.gz")
provides=('websockify')
md5sums=('6b603874b502bcd9d509e664c97ca780')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
