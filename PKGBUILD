# Maintainer: redfish <redfish@galactica.pw>

pkgname=ssb-server
pkgver=14.1.12
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

sha256sums=('9e3fbf6c1f291780a45b14a16462cef14a487bee0fe646a8893782fae5321bb5')
