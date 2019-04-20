# Maintainer: redfish <redfish@galactica.pw>

pkgname=dat
pkgver=13.12.2
pkgrel=1
pkgdesc="Open protocol for distributed peer-to-peer data exchange"
arch=(any)
url="https://datproject.org"
license=('BSD')
depends=('nodejs' 'npm')
source=(https://github.com/datproject/dat/archive/v$pkgver.tar.gz)

options=(!strip)

package(){
  npm install -g --user root --prefix "${pkgdir}/usr" "$srcdir/v${pkgver}.tar.gz"
}

sha256sums=('a1a7071e8cc0d01691dce8d957cb9a9c7d47a0c54fbd981e4183a6b60d236d38')
