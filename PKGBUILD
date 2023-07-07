pkgname=electrs-systemd
pkgver=1
pkgrel=1
pkgdesc="systemd service for electrs"
arch=(any)
license=('Apache')
depends=('bitcoin-daemon' 'electrs')
source=("electrs.service")
b2sums=("5510d780d023dcd905ffbcb1412507762dcbd27651f3fb0b4278749c202ae8b24d735709ab2c24988daea5cc41f06098d11e4527404d7dee08d660b408a99fdb")

package() {
  install -Dm644 "$srcdir/electrs.service" "$pkgdir/usr/lib/systemd/system/electrs.service"
}
