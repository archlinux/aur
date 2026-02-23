# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.7.1
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL-2.0-or-later')
depends=('sh' 'iproute2')
makedepends=('systemd') # workaround: otherwise sqm@.service ends up at the wrong directory
source=("$pkgname-$pkgver.tar.gz::https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('77df6a0ecfc6657dfa2e9b042d5d1be7a5a5c06ef389179fab7969ede5ef88a3')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
