# Maintainer: Prasad Kumar
pkgname=telinkrin-gtk-theme
pkgver=2.5
pkgrel=2
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('telinkrin-gtk-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Telinkrin-$pkgver.tar.xz")
sha512sums=('56d608fd93a50ed6ce59aabe494a98c0a73f9b92fbe60165a2d2e7f25440b1a3302ee09ae83173e29d8d6262653c7a8b1a9141befd00f9fd63f413b8e4edd0ac')
package() {
  cd "${srcdir}"/Telinkrin-$pkgver
  install -d "$pkgdir"/usr/share/themes/Telinkrin
  cp -rf gtk-* "$pkgdir"/usr/share/themes/Telinkrin
}
