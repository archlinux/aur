# Contributor: Kyle Keen < keenerd at gmail >

pkgname=ttf-glass-tty
pkgver=1
pkgrel=3
pkgdesc='Hacking with style: ttf VT220'
arch=('any')
license=('custom:copyright')
url='http://sensi.org/~svo/glasstty/'
#source=("http://sensi.org/~svo/glasstty/Glass_TTY_VT220.ttf")
source=("http://www.spacerogue.net/images/Glass_TTY_VT220.ttf")
md5sums=('7342d5c4c32ea4aa69c5d22d2f461fbb')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}

