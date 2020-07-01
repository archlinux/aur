# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>

pkgname=ttf-font-icons
pkgver=1.1
pkgrel=2
pkgdesc="A non-overlapping mix of Ionicons and Awesome iconic fonts"
url="http://kageurufu.net/icons.pdf"
# Alternative URL: https://drive.google.com/file/d/0B3iQeXAmzOoLaERrZ1BQX0FreDg/view?usp=sharing
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
options=("!strip")
arch=('any')
source=('icons.ttf')
md5sums=('800c09709d456a127bc9160ec1ecddf6')

package() {
  install -m 644 -D "$srcdir/icons.ttf" "$pkgdir/usr/share/fonts/TTF/icons.ttf"
}
