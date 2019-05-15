# Maintainer: redfish <redfish@galactica.pw>

pkgname=ssb-server
pkgver=15.0.1
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

sha256sums=('c81771e1b7bc91d75b286fe9c851c863cfa2a3617b7e7d1bb75f5df9aa661cf8')
