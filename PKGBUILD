# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname='fet-timetabling-bin'
pkgver=6.14.2
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
provides=("fet-timetabling=${pkgver}")
conflicts=('fet-timetabling')
source=("https://gitlab.com/phrippy/fet-bin/-/raw/main/fet-bin-${pkgver}.tar.xz")
sha256sums=('92df353ba905a006a0046023f33bdaf54611dfaac137a0e0c601f3a553ec207f')
package() {
  cd "$srcdir"
  bsdtar -xf "fet-bin-${pkgver}.tar.xz" -C "$pkgdir"
}
