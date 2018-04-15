# Maintainer: Prasad Kumar
pkgname=arrongin-gtk-theme
pkgver=2.5
pkgrel=1
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('arrongin-gtk-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Arrongin-$pkgver.tar.xz")
sha512sums=('2ea560d11035ffa68e0d7c948ee755a955e410b161220f8d67b19624b16b6a62026f6b09b6bbd78956ac973a49bbd1baef857aa9d66499d50af50959693acd8c')
package() {
  cd "${srcdir}"/Arrongin-$pkgver
  install -d "$pkgdir"/usr/share/themes/Arrongin
  cp -rf * "$pkgdir"/usr/share/themes/Arrongin
}
