# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=argon
pkgver=2.0.4
pkgrel=3
pkgdesc="the noble lightweight GUI package manager + update notifier (with full AUR support)"
url="https://github.com/14mRh4X0r/arch-argon"
license=('GPL')
arch=('any')
depends=(bash auracle-git pacman-contrib pacaur libnotify python python-gobject gtk3 vte3)
source=("https://github.com/14mRh4X0r/arch-argon/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('8dfd7ae15044717071f843001ee4e3b5849fb0d5d87745871f09ecef50a5e820c9f67712ed8ca74a7eaa09f9c7415b726b224b7aed477b54419b1929ec5fab74')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
