# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Laszlo Papp

pkgname=monaco-linux-font
pkgver=1
pkgrel=3
pkgdesc="Mono-spaced Macintosh system font"
arch=('any')
license=('unknown')
url="http://www.apple.com"
depends=('fontconfig')
replaces=('monaco_linux')
install=monaco-linux.install
source=('http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf')
md5sums=('15406419f73436c28b7e7684d6e3f346')

package() {
  install -Dm644 "$srcdir/Monaco_Linux.ttf" "$pkgdir/usr/share/fonts/TTF/Monaco_Linux.ttf"
}
