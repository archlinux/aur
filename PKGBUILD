# Maintainer: John Lane <archlinux at jelmail dot com>
#
# Font based on Edward Johnston's London Underground type designed for London Transport in 1915.

pkgname=ttf-london-tube
pkgver=1.0
pkgrel=2
pkgdesc="A font based on Edward Johnston's London Underground type designed for London Transport in 1915"
arch=('any')
url='http://www.fontspace.com/jonathan-paterson/london-tube'
license=('Freeware')
install='install'

source=('london-tube.zip::https://get.fontspace.co/download/family/g841/c7c2913047ba4341929c4a014108d700/london-tube-font.zip')

sha256sums=('8797565d9d3d10e672cdebababdaf866820d564cc9c51e336421f8e9ebf676a9')

package() {
  install -dm755 $pkgdir/usr/share/fonts/TTF
  find "$srcdir" -name "*.ttf" -exec install {} $pkgdir/usr/share/fonts/TTF \;
}
