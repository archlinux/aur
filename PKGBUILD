# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=argon
pkgver=2.0.1
pkgrel=1
pkgdesc="the noble lightweight GUI package manager + update notifier (with full AUR support)"
url="https://github.com/14mRh4X0r/arch-argon"
license=('GPL')
arch=('any')
depends=(bash cower pacaur libnotify python python-gobject gtk3 vte3)
source=("https://github.com/14mRh4X0r/arch-argon/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('8c00f02ba8ced4835899d49e8f3466fca88572b91bc52f333f41c5d9a9b97fa8df2d77aab053c7e632c540a6ddad7424d708302c82dc1cc2d52d8b2dda37afdf')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}

