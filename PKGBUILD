# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.5.0
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL')
depends=('sh' 'iproute2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('93407405ef89f844a56169c80ffca82e57408a048c6a14511232def05e8f5307')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
