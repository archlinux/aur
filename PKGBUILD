# Maintainer: redfish <redfish@galactica.pw>

pkgname=ssb-server
pkgver=15.0.2
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

sha256sums=('0a41b2919b549105436f8fd259194cfd52b79923ce0296d049eb57e2c11f125a')
