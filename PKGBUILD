# Contributor: vmon <vmon@riseup.net>
# Maintainer: Achilleas Pipinellis <axilleas archlinux info>

pkgname=ooniprobe
pkgver=1.2.2
pkgrel=1
pkgdesc="Open Observatory of Network Interference"
arch=('any')
url="https://ooni.torproject.org"
license=('BSD')
depends=( 'python2'
          'tor'
          'tcpdump'
          'python2-yaml'
          'python2-twisted'
          'python2-ipaddr'
          'python2-pyopenssl'
          'python2-geoip'
          'txtorcon'
          'python2-txsocksx'
          'python2-parsley'
          'scapy'
          'python2-pcapy'
          'python2-service-identity'
          'geoip-asndata'
          'geoip-database'
          'geoip-citydata'
          )
makedepends=(
          'python2-setuptools'
          'python2-dnspython'
          'python2-docutils'
          'python2-zope-interface'
          'libdnet'
            )
source=("https://pypi.python.org/packages/source/o/${pkgname}/${pkgname}-${pkgver}.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" -O1
}

# vim:set ts=2 sw=2 et:
md5sums=('056735d6955a4f210701d7a304dba821')
