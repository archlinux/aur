# Maintainer: Miloš Polakovič <milos@mailbox.org>
pkgname=netctl-eduroam-fmfi
pkgver=20160203
pkgrel=3
pkgdesc='Example netctl profile for eduroam at FMFI UK (Bratislava)'
arch=(i686 x86_64)
url=https://gitlab.com/MrdAUR/netctl-eduroam-fmfi
license=(MIT)
depends=(ca-certificates netctl)
source=(eduroam-fmfi)
install=install
package() {
  mkdir -p $pkgdir/etc/netctl/examples/
  cp eduroam-fmfi $pkgdir/etc/netctl/examples/
}
md5sums=('1f8683d9f3d014d3613e38e2b84e8205')
sha1sums=('1f427cf560988c5cf4483a28be9dc681f76c0088')
sha256sums=('35792972272a8ade264a601e92febae56c08be911811c01fab6db51e8cc56686')
