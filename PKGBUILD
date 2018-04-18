# Maintainer: Prasad Kumar
pkgname=gnome-shell-theme-telinkrin
pkgver=2.5
pkgrel=2
pkgdesc="GNOME Shell theme for Telinkrin GTK Theme"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=('CC BY-NC-SA')
depends=('gnome-shell>=3.26')
provides=('gnome-shell-theme-telinkrin')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Telinkrin-shell-$pkgver.tar.xz")
sha512sums=('b6e48f916e1c65e15ea53e81500d88b8bf02756e9efce1af54dad8277eb7991bb7ccc9e90a72f1c8b54a6754e8be69cec273b1acc0b4c29ade8eee81d19b34b9')
package() {
  cd "${srcdir}"/Telinkrin-shell-${pkgver}
  install -d "$pkgdir"/usr/share/themes/Telinkrin
  cp -rf "gnome-shell" "$pkgdir"/usr/share/themes/Telinkrin
}
