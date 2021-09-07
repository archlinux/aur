# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=argon
pkgver=2.1.0
pkgrel=1
pkgdesc="the noble lightweight GUI package manager + update notifier (with full AUR support)"
url="https://github.com/14mRh4X0r/arch-argon"
license=('GPL')
arch=('any')
depends=(bash auracle-git pacman-contrib pacaur libnotify python python-gobject gtk3 vte3)
source=("https://github.com/14mRh4X0r/arch-argon/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('51391dfd68a4587757765c0012ea8778ce01be5d4884004e669106498c56d1d7577f1d368ff0e7cf6bbdcf1912efe4a62b68cc83971b05fd24540d8c0a02cebd')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
