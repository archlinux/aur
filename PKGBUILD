# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=ruget-bin
pkgver=0.4.3
pkgrel=1
arch=(x86_64)
pkgdesc="Alternative to wget written in Rust"
url="https://github.com/ksk001100/ruget"
license=('MIT')
depends=("openssl-1.0")
_archivename="ruget-v${pkgver}-${arch}-unknown-linux-gnu"
source=("https://github.com/ksk001100/ruget/releases/download/v${pkgver}/${_archivename}.zip")
sha256sums=('fba869d379e10bc8bcc3808a9f16708396ffa2a3def6a874708b2d92b44c256d')

package() {
  cd "$srcdir/$_archivename"
  mkdir -p "$pkgdir/usr/bin"
  cp ruget "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
