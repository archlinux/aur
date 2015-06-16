# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=ttf-font-awesome
pkgver=4.3.0
pkgrel=3

pkgdesc="Iconic font designed for Bootstrap"
url="http://fortawesome.github.io/Font-Awesome/"
license=('CCPL')

depends=('fontconfig' 'xorg-font-utils')
arch=('any')
source=("https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz")
sha256sums=('cc75bfea92128834c379d69f776ecbd103256137f8f482cad71425e68ee4be97')
install=$pkgname.install

package() {
  cd Font-Awesome-$pkgver/fonts
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
