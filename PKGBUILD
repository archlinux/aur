# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.2.4
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL')
depends=('sh' 'iproute2')
source=("https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('5d636e2a0bf306be94978ae21ea8ed62731a32c3ecf06c2b65d384f7e628a8fd')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
