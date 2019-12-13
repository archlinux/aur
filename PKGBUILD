# Maintainer: redfish <redfish@galactica.pw>

pkgname=ssb-server
pkgver=15.2.0
pkgrel=1
pkgdesc="The gossip and replication server for Secure Scuttlebutt - a distributed social network"
arch=(any)
url="https://scuttlebut.io"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://github.com/ssbc/ssb-server/archive/v$pkgver.tar.gz)

options=(!strip)

package(){
  npm install -g --user root --prefix "${pkgdir}/usr" "$srcdir/v${pkgver}.tar.gz"
}

sha256sums=('b5c8ae6c87035e70b1e7031ce396e132665bbcb93206f94b910519db2764c138')
