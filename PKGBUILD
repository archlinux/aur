# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.5.2
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL')
depends=('sh' 'iproute2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('95227fc0092665803b23a42ac5544e917d6dd1d843d387a0e13456a8d32e61cc')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
