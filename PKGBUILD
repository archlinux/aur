# Contributor: vmon <vmon@riseup.net>
# Maintainer: Achilleas Pipinellis <axilleas archlinux info>

pkgname=ooniprobe
_pkgname=ooni-probe
pkgver=1.2.2
pkgrel=2
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
          'python2-pypcap'
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
          'libpcap'
          'libffi'
          'openssl'
            )
source=("https://github.com/TheTorProject/$_pkgname/archive/v${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" -O1
}

# vim:set ts=2 sw=2 et:
md5sums=('c4f64bb1ce4acc88b08d33bb35fbf7ed')
