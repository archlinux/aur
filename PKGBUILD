# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.7.2
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL-2.0-or-later')
depends=('sh' 'iproute2')
makedepends=('systemd') # workaround: otherwise sqm@.service ends up at the wrong directory
source=("$pkgname-$pkgver.tar.gz::https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('aed4642ab716012e9f90862061217207eb052ed453ccb05244fb1ab8e73fd258')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
