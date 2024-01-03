# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.6.0
pkgrel=2
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL')
depends=('sh' 'iproute2')
makedepends=('systemd') # workaround: otherwise sqm@.service ends up at the wrong directory
source=("$pkgname-$pkgver.tar.gz::https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('d30ee75067b857773df84d540e09dc578223a43afe30ec4887fd2f6ac493dc9c')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
