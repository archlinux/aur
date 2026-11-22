# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname='fet-timetabling-bin'
pkgver=7.12.1
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
provides=("fet-timetabling=${pkgver}")
conflicts=('fet-timetabling')
source=("https://gitlab.com/phrippy/fet-bin/-/raw/main/fet-bin-${pkgver}.tar.xz")
sha256sums=('958ac4b6d260dcbf9057d453906717eab6a6261bb23ae9466da347c3ad1ccc7a')
package() {
  cd "$srcdir"
  bsdtar -xf "fet-bin-${pkgver}.tar.xz" -C "$pkgdir"
}
