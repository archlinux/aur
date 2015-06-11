pkgname=netctl-eduroam
pkgver=0.3
pkgrel=1
pkgdesc='Example netctl profile for eduroam'
arch=(i686 x86_64)
url=http://higgsboson.tk/
license=(MIT)
depends=(ca-certificates netctl)
source=(eduroam)
install=install

package() {
  mkdir -p $pkgdir/etc/netctl/examples/
  cp eduroam $pkgdir/etc/netctl/examples/
}
md5sums=('57f90a14c3ab8d82217cbbe0749a9a4c')
sha1sums=('1e393ca918ca902f6d6f1d6f78e6d0891acd0214')
sha256sums=('a44d15b208e167c5035304015060b7bd0e852873bdc242ad3c4efc5c01cb8943')
