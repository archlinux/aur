# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.7.0
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL-2.0-or-later')
depends=('sh' 'iproute2')
makedepends=('systemd') # workaround: otherwise sqm@.service ends up at the wrong directory
source=("$pkgname-$pkgver.tar.gz::https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('fae70c182c512cdd3ac6417f4384bf1b102266a8ee877fcccf3026328476fd16')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
