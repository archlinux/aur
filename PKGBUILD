# Maintainer: redfish <redfish@galactica.pw>

pkgname=dat
pkgver=13.13.1
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

sha256sums=('6b9591230f8c12d6a52f3dddb8fa7c1b67723a15f09510178bbb1e748f2f6970')
