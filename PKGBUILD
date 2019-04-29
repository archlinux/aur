# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.3.0
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL')
depends=('sh' 'iproute2')
source=("https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('236365bfd3b4dedda0f530cbbb0a85b6e11d6051d992214df52311222901c528')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
