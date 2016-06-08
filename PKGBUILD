# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-tiresias
pkgver=20090804
pkgrel=1
pkgdesc="A set of free Sans Serif TrueType fonts"
arch=('any')
url="https://www.fontsquirrel.com/fonts/Tiresias-Infofont"
license=('GPL3')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(https://www.fontsquirrel.com/fonts/download/Tiresias-Infofont)
md5sums=('865e994fa168b1b79c320d8250978a11')

package() {
  install -d $pkgdir/usr/share/fonts/TTF 
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ 
}
