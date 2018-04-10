# Maintainer: Prasad Kumar
pkgname=telinkrin-gtk-theme
pkgver=2.4
pkgrel=1
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('telinkrin-gtk-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Telinkrin-$pkgver.tar.xz")
sha512sums=('f30a31500214f65f1f21db95adcc5a5b1f1ba891024b066621f7079f2d6752f244c377e22485ce99302074b91846285ac20a6675c67da9a6420a41479f777669')
package() {
  cd "${srcdir}"/Telinkrin-$pkgver
  install -d "$pkgdir"/usr/share/themes/Telinkrin
  cp -rf * "$pkgdir"/usr/share/themes/Telinkrin
}
