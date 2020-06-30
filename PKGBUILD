# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=ruget-bin
pkgver=0.4.2
pkgrel=1
arch=(x86_64)
pkgdesc="Alternative to wget written in Rust"
url="https://github.com/ksk001100/ruget"
license=('MIT')
depends=("openssl-1.0")
_archivename="ruget-v${pkgver}-${arch}-unknown-linux-gnu"
source=("https://github.com/ksk001100/ruget/releases/download/v${pkgver}/${_archivename}.zip")
sha256sums=('aabb757d036eec3a1e4df4e1d067b99a12a14ad9ba5a54f018c809334466fa66')

package() {
  cd "$srcdir/$_archivename"
  mkdir -p "$pkgdir/usr/bin"
  cp ruget "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
