# Maintainer: redfish <redfish@galactica.pw>

pkgname=dat
pkgver=14.0.2
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

sha256sums=('2d7c9a9a435ed9d2a8118496868e65caa60494918e56f2f56d82d74b41c0b67d')
