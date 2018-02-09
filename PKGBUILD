# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=argon
pkgver=2.0.3
pkgrel=1
pkgdesc="the noble lightweight GUI package manager + update notifier (with full AUR support)"
url="https://github.com/14mRh4X0r/arch-argon"
license=('GPL')
arch=('any')
depends=(bash auracle pacaur libnotify python python-gobject gtk3 vte3)
source=("https://github.com/14mRh4X0r/arch-argon/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('09a5e22fd9006457e25fd6110ab04eb171f8b6051fcdab12ca9c7fd2ddfe784dd2d4498f3fd5a881f9b7bc477687f1074813e8028c7be38e080307678a462b2e')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
