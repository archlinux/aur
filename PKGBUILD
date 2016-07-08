# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=ttf-font-awesome
pkgver=4.6.3
pkgrel=1

pkgdesc="Iconic font designed for Bootstrap"
url="http://fortawesome.github.io/Font-Awesome/"
license=('CCPL')

depends=('fontconfig' 'xorg-font-utils')
arch=('any')
source=("https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz")
sha256sums=('669fb1210c64eda3f998c86941641f1bcd0af4450643daf8841cb62d2b6c71a4')
install=$pkgname.install

package() {
  cd Font-Awesome-$pkgver/fonts
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
