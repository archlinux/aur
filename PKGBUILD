# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname='fet-timetabling-bin'
pkgver=7.2.2
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
provides=("fet-timetabling=${pkgver}")
conflicts=('fet-timetabling')
source=("https://gitlab.com/phrippy/fet-bin/-/raw/main/fet-bin-${pkgver}.tar.xz")
sha256sums=('85a07563c3210ac45e399481a1483a3c0960e082244e5d8f9e0da282a06c88bf')
package() {
  cd "$srcdir"
  bsdtar -xf "fet-bin-${pkgver}.tar.xz" -C "$pkgdir"
}
