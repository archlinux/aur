# Maintainer: Kyle Keen < keenerd at gmail >

pkgname=ttf-lobsang-monlam
pkgver=1
pkgrel=1
pkgdesc='A Tibetan font, Monlam Bod-Yig'
arch=('any')
license=('Apache')
url='http://lobsangmonlam.org/'
depends=('xorg-font-utils' 'fontconfig')
install='ttf-lobsang-monlam.install'
source=("http://monlam-dictionary.googlecode.com/files/monlambodyig.ttf")
md5sums=('e5da214e2c392d00f29af696c813b63e')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}

