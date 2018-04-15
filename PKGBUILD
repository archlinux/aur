# Maintainer: Prasad Kumar
pkgname=gnome-shell-theme-telinkrin
pkgver=2.5
pkgrel=1
pkgdesc="GNOME Shell theme for Telinkrin GTK Theme"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=('CC BY-NC-SA')
depends=('gnome-shell>=3.26')
provides=('gnome-shell-theme-telinkrin')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Telinkrin-shell-$pkgver.tar.xz")
sha512sums=('d993943695569e42ab33b00b81c5a4c8f87b0e9262604e3d82d9e78cf13ba31aa2bd3a512fc2ac56dd084a03d3c979cc21fe72f0b38b48401cd1c056a48c4902')
package() {
  cd "${srcdir}"/Telinkrin-shell-${pkgver}
  install -d "$pkgdir"/usr/share/themes/Telinkrin
  cp -rf * "$pkgdir"/usr/share/themes/Telinkrin
}
