# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=ttf-font-awesome
pkgver=4.4.0
pkgrel=1

pkgdesc="Iconic font designed for Bootstrap"
url="http://fortawesome.github.io/Font-Awesome/"
license=('CCPL')

depends=('fontconfig' 'xorg-font-utils')
arch=('any')
source=("https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz")
sha256sums=('3962ab205a1547be1e10a840f44fa6b6a28359e6f3f21932f0f8dabf419eeccb')
install=$pkgname.install

package() {
  cd Font-Awesome-$pkgver/fonts
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
