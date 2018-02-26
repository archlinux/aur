# Maintainer: Prasad Kumar
pkgname=arrongin-gtk-theme
pkgver=1
pkgrel=3
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=("CC BY-NC-SA")
depends=('bash')
provides=('arrongin-gtk-theme')
source=("${pkgname}::https://dl.opendesktop.org/api/files/downloadfile/id/1519515160/s/7d4d0b84054870d41ae3d838dee252c1/t/1519660633/u//Arrongin-$pkgver.$pkgrel.tar.xz")
sha512sums=('9e33956270fdc0b832abacb9d564db3c3cfa7d6e42fd339d86343a29bc97afb28010141292cd0656dfaea9bf419d8ebd4bcd6b39cbe25fcc6c7f11b58f2e8258')
package() {
  cd ${srcdir}/Arrongin-1.3
  install -d "$pkgdir"/usr/share/themes/${pkgname}
  cp -rf * "$pkgdir"/usr/share/themes/${pkgname}
}

