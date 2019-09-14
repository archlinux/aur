# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.4.0
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL')
depends=('sh' 'iproute2')
source=("https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('77801ba52438b049f9a59604cb346f8303c64244987a9969e7b89036faf29550')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
