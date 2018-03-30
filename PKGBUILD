# Maintainer: Prasad Kumar
pkgname=gnome-shell-theme-arrongin
pkgver=2.1
pkgrel=1
pkgdesc="GNOME Shell theme for Arrongin GTK Theme"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=('CC BY-NC-SA')
depends=('gnome-shell>=3.26')
provides=('gnome-shell-theme-arrongin')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1522367359/s/d02482ad86126f63d6fa404d6078af3c/t/1522433804/u/455718/Arrongin-shell-$pkgver.tar.xz")
sha512sums=('fd87bf6c516013da3529b6613f76d89205f2aa9882c09bd3294381d9ac17b41c9cacc642518c3ea3e014da2a2294eb393530cc967fd1ee8ebafebd2ceb786e2c')
package() {
  cd "${srcdir}"/Arrongin-shell-${pkgver}
  install -d "$pkgdir"/usr/share/themes/${pkgname}
  cp -rf * "$pkgdir"/usr/share/themes/${pkgname}
}
