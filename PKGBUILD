# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=ttf-font-awesome
pkgver=4.5.0
pkgrel=2

pkgdesc="Iconic font designed for Bootstrap"
url="http://fortawesome.github.io/Font-Awesome/"
license=('CCPL')

depends=('fontconfig' 'xorg-font-utils')
arch=('any')
source=("https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz")
sha256sums=('7813f416057da622b16229b10fef550e1dc64c5bb59871cd38fa86e76dfdbae8')
install=$pkgname.install

package() {
  cd Font-Awesome-$pkgver/fonts
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
