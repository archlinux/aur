# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname='fet-timetabling-bin'
pkgver=6.28.3
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
provides=("fet-timetabling=${pkgver}")
conflicts=('fet-timetabling')
source=("https://gitlab.com/phrippy/fet-bin/-/raw/main/fet-bin-${pkgver}.tar.xz")
sha256sums=('b3a6fcf13ed7372e71d28ed2cea8c40295d504062945de51a257deee894f87e9')
package() {
  cd "$srcdir"
  bsdtar -xf "fet-bin-${pkgver}.tar.xz" -C "$pkgdir"
}
