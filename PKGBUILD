# Maintainer: Prasad Kumar
pkgname=gnome-shell-theme-arrongin
pkgver=2.0
pkgrel=1
pkgdesc="GNOME Shell theme for Arrongin GTK Theme"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=('CC BY-NC-SA')
depends=('gnome-shell>=3.26')
provides=('gnome-shell-theme-arrongin')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1521662261/s/8126f04c1d8cd7d95faf2a1e0df78426/t/1521750222/u/455718/Arrongin-shell-$pkgver.tar.xz")
sha512sums=('2e8ee4389396ba15901f97ab5c58767863c2a51b7a98d1f3150c601d2cddc6ebee5aedb30cc087e80ecf4f3a98df5b303859f7ef90c96104f0d9aace5ea41ea1')
package() {
  cd "${srcdir}"/Arrongin-shell-${pkgver}
  install -d "$pkgdir"/usr/share/themes/${pkgname}
  cp -rf * "$pkgdir"/usr/share/themes/${pkgname}
}
