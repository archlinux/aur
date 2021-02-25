# Maintainer: EndeavourOS-Team <info@endeavouros.com>

pkgname=reflector-simple
pkgdesc="Simple GUI wrapper for 'reflector'."
pkgver=1.5
pkgrel=1
arch=('any')
license=('GPL')
depends=(
  bash yad reflector whois geoip bind
)

url="https://github.com/endeavouros-team/PKGBUILDS/raw/master/$pkgname"

source=(
  $pkgname
  $pkgname.desktop
)
sha512sums=('788319605396818f4932cb04ad4faf1fcff4a5fee87f0f78a507f6960f393dc7eca635fd95655f18c1de72ae5cac4e3894bb089f024fc2271cee3bedad0d44ba'
            '2def334909a5bbe3c6f82043f62a0f3f3c6747b7813ad9154f43e70c303301e079f8e81ea41b306f1b6f8a8e37afd535686b2e4642fb6b9357d97a7fad1e0d0a')

package() {
  cd $srcdir

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/applications

  install -Dm755 $pkgname         $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
