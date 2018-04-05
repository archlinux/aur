# Maintainer: Prasad Kumar
pkgname=telinkrin-gtk-theme
pkgver=2.3
pkgrel=6
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('telinkrin-gtk-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Telinkrin-$pkgver.tar.xz")
sha512sums=('6a37884364a52467892eb2cb6bf81a7584b4a2a1b689c21e29f045882c0f779cc19f64fb29306ea2a291bbb006a5c2165e1d97046aa326ed6cfab7de69569863')
package() {
  cd "${srcdir}"/Telinkrin-$pkgver
  install -d "$pkgdir"/usr/share/themes/Telinkrin
  cp -rf * "$pkgdir"/usr/share/themes/Telinkrin
}
