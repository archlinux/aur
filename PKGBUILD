# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.5.1
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL')
depends=('sh' 'iproute2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('5f54998e70759b5a3946fb19792f69ccfcccd7cc2a06037e2b8b945a3623ada0')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
