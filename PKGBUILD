# Maintainer: Prasad Kumar
pkgname=arrongin-gtk-theme
pkgver=2.4
pkgrel=1
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('arrongin-gtk-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Arrongin-$pkgver.tar.xz")
sha512sums=('ebfecb6d08431398b4a95028ce2c6bb0a9cf0938de99d9638901c97da159d1a687128a7b37f23e2a537a8cc79ee3354279ff5bc721e099e88da5344d668a7886')
package() {
  cd "${srcdir}"/Arrongin-$pkgver
  install -d "$pkgdir"/usr/share/themes/Arrongin
  cp -rf * "$pkgdir"/usr/share/themes/Arrongin
}
