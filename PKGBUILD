# Maintainer: Thomas Kovac <thomaskovac@gmail.com>
pkgname=oce_varioprint
pkgver=1.0
pkgrel=1
pkgdesc="PPD files CUPS needs in order to install OCE VarioPrint printers"
arch=('any')
license=('custom')
optdepends=('cups: printing support')
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

package() {
  cd "$pkgname-$pkgver"
  install -d -m755 ${pkgdir}/usr/share/cups/model/OCE
  install -D -m644 *.ppd ${pkgdir}/usr/share/cups/model/OCE
}
