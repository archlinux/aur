# Maintainer: Henri Chain <henri@henri-chain.com>
pkgname=upnp-inspector
pkgver=0.2.2
pkgrel=1
pkgdesc="UPnP Device and Service analyzer based on the Coherence DLNA/UPnP framework"
arch=('any')
url="https://github.com/coherence-project/UPnP-Inspector"
depends=('python2' 'coherence' 'pygtk' 'python2-setuptools')
license=('MIT')
source=("https://github.com/coherence-project/UPnP-Inspector/archive/UPnP-Inspector-${pkgver}.tar.gz")
md5sums=('1d4d235bcd5f7a10e560614e369e5a2f')

package() {
  cd "$srcdir/UPnP-Inspector-UPnP-Inspector-${pkgver}/"
  python2 setup.py install --root="$pkgdir"
}
