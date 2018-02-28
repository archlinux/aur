# Maintainer: Prasad Kumar
pkgname=arrongin-gtk-theme
pkgver=1.4
pkgrel=2
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=("CC BY-NC-SA")
depends=('bash')
provides=('arrongin-gtk-theme')
source=("${pkgname}::https://dl.opendesktop.org/api/files/downloadfile/id/1519768997/s/a9ad8c01a5b923afaff0d41785bf56fe/t/1519795001/u//Arrongin-$pkgver.tar.xz")
sha512sums=('31a6575828ee87f82b6001846578dc328e84686455ba83f52150089849a31e98466027f1b613d94b51f56bc0d15f136fb7b2005eb2ca35707193c937679f1c77')
package() {
  cd ${srcdir}/Arrongin-${pkgver}
  install -d "$pkgdir"/usr/share/themes/${pkgname}
  cp -rf * "$pkgdir"/usr/share/themes/${pkgname}
}
