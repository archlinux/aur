# Maintainer: Prasad Kumar
pkgname=arrongin-gtk-theme
pkgver=2.2
pkgrel=1
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('arrongin-gtk-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1522484515/s/bf625383afc97de8b541be68eac914a2/t/1522605575/u/455718/Arrongin-$pkgver.tar.xz")
sha512sums=('16e45c57923dfec4ada79a46be558a9b25c281c1db89fc302e5c859245062f6034fa65fa823b09693fc9b37bd7625d33caa119ba52e6e0a977567b5b5b20712e')
package() {
  cd "${srcdir}"/Arrongin-$pkgver
  install -d "$pkgdir"/usr/share/themes/${pkgname}
  cp -rf * "$pkgdir"/usr/share/themes/${pkgname}
}
