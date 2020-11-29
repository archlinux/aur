# Maintainer: Alexander Georgievskiy <galeksandrp@gmail.com>

pkgname=lib32-libva1-compat
pkgver=0.1.0
pkgrel=1
pkgdesc='ln -s /usr/lib32/libva.so /usr/lib32/libva.so.1 (fix VAAPI for Steam)'
arch=(x86_64)
url='https://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=(lib32-libva)
makedepends=()
optdepends=()
source=()
sha512sums=()

package() {
  mkdir -p "${pkgdir}/usr/lib32"

  ln -s /usr/lib32/libva.so "${pkgdir}/usr/lib32/libva.so.1"
  ln -s /usr/lib32/libva-x11.so "${pkgdir}/usr/lib32/libva-x11.so.1"
}
