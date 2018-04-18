# Maintainer: Prasad Kumar
pkgname=gnome-shell-theme-arrongin
pkgver=2.5
pkgrel=2
pkgdesc="GNOME Shell theme for Arrongin GTK Theme"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=('CC BY-NC-SA')
depends=('gnome-shell>=3.26')
provides=('gnome-shell-theme-arrongin')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Arrongin-shell-$pkgver.tar.xz")
sha512sums=('5ce14e3da5db721f0ba74170b52c4e3778440bcf8ac7dc14bed2f5222e38a3125794a9dafadbcf096a6588a2e7a4be809019d974c305696fe876262a8c721aa3')
package() {
  cd "${srcdir}"/Arrongin-shell-${pkgver}
  install -d "$pkgdir"/usr/share/themes/Arrongin
  cp -rf "gnome-shell" "$pkgdir"/usr/share/themes/Arrongin
}
