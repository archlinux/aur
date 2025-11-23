# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname='fet-timetabling-bin'
pkgver=7.5.7
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
provides=("fet-timetabling=${pkgver}")
conflicts=('fet-timetabling')
source=("https://gitlab.com/phrippy/fet-bin/-/raw/main/fet-bin-${pkgver}.tar.xz")
sha256sums=('3e81a0f95d3d295a8574ae9a4201a3daaf47bcd527b1116d9e813ebe63c958b6')
package() {
  cd "$srcdir"
  bsdtar -xf "fet-bin-${pkgver}.tar.xz" -C "$pkgdir"
}
