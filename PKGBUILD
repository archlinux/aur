# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=argon
pkgver=2.0.2
pkgrel=1
pkgdesc="the noble lightweight GUI package manager + update notifier (with full AUR support)"
url="https://github.com/14mRh4X0r/arch-argon"
license=('GPL')
arch=('any')
depends=(bash cower pacaur libnotify python python-gobject gtk3 vte3)
source=("https://github.com/14mRh4X0r/arch-argon/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('d5ee909df1e215c2c0df28df1f105a6a85ea2858b75e1f47ac6aa970b77cb2cfa996f9950063fba10b46a0bda6938367fbef3eaadb0cfb631d096f0eaec21440')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
