# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=ruget-bin
pkgver=0.3.1
pkgrel=1
arch=(x86_64)
pkgdesc="Alternative to wget written in Rust"
url="https://github.com/ksk001100/ruget"
license=('MIT')
depends=("glibc" "gcc-libs" "openssl-1.0")
_archivename="ruget-v${pkgver}-${arch}-unknown-linux-gnu"
source=("https://github.com/ksk001100/ruget/releases/download/v${pkgver}/${_archivename}.zip")
sha256sums=('b0065b62fc66d26e63f8e4d714b5d91b4650308e0ad9191887d3f2813d42d856')

package() {
  cd "$srcdir/$_archivename"
  mkdir -p "$pkgdir/usr/bin"
  cp ruget "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
