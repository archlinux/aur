# Maintainer: John Lane <archlinux at jelmail dot com>
#
# Font based on Edward Johnston's London Underground type designed for London Transport in 1915.

pkgname=ttf-london-tube
pkgver=1.0
pkgrel=1
pkgdesc="A font based on Edward Johnston's London Underground type designed for London Transport in 1915"
arch=('any')
url='http://www.fontspace.com/jonathan-paterson/london-tube'
license=('Freeware')
install='install'

source=('london-tube.zip::http://dl1.fontflood.com/download.ashx?guid=c7c2913047ba4341929c4a014108d700&name=jonathan-paterson_london-tube.zip')

md5sums=('3b14704a3323fb9a4d3e30d04b734dca')

package() {
  install -dm755 $pkgdir/usr/share/fonts/TTF
  find "$srcdir" -name "*.ttf" -exec install {} $pkgdir/usr/share/fonts/TTF \;
}
