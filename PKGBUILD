# Maintainer: Prasad Kumar
pkgname=gnome-shell-theme-telinkrin
pkgver=2.1
pkgrel=2
pkgdesc="GNOME Shell theme for Telinkrin GTK Theme"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=('CC BY-NC-SA')
depends=('gnome-shell>=3.26')
provides=('gnome-shell-theme-telinkrin')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1522367339/s/5bcc8bcf4cf26695e8daa28acfea4017/t/1522700017/u/455718/Telinkrin-shell-$pkgver.tar.xz")
sha512sums=('8edf01058de7172be1c1a48e8c95ec1c90816508e8fd0b3cfe0ea9043a07264391d26d3a800f4097fa40ab626753ca22940eb4b469dc9b5d4529c247324f0b17')
package() {
  cd "${srcdir}"/Telinkrin-shell-${pkgver}
  install -d "$pkgdir"/usr/share/themes/Telinkrin
  cp -rf * "$pkgdir"/usr/share/themes/Telinkrin
}
