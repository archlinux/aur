# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=ttf-font-awesome
pkgver=4.6.1
pkgrel=1

pkgdesc="Iconic font designed for Bootstrap"
url="http://fortawesome.github.io/Font-Awesome/"
license=('CCPL')

depends=('fontconfig' 'xorg-font-utils')
arch=('any')
source=("https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz")
sha256sums=('0d6113f902d8ee1a75131759a3178f914b252868b2089f0c0fb6d5becb47c6a5')
install=$pkgname.install

package() {
  cd Font-Awesome-$pkgver/fonts
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
