# Maintainer: Prasad Kumar
pkgname=arrongin-gtk-theme
pkgver=2.0
pkgrel=2
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('arrongin-gtk-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1521662287/s/c907d42087b841b70d2919dd922c074e/t/1521744972/u/455718/Arrongin-$pkgver.tar.xz")
sha512sums=('b37a6b753281c8035d09623e2e615c2c94c4681307942d559f383028fd08fe742046b867a321875b13ec32db99f16d9b073e949c8151916a6ba8eed8bed3a36d')
package() {
  cd "${srcdir}"/Arrongin-${pkgver}-theme
  install -d "$pkgdir"/usr/share/themes/${pkgname}
  cp -rf * "$pkgdir"/usr/share/themes/${pkgname}
}
