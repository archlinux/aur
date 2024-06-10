# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Kyle Keen < keenerd at gmail >

pkgname=ttf-glass-tty
pkgver=1
pkgrel=5
pkgdesc='Hacking with style: ttf VT220'
arch=('any')
license=('Unlicense')
url='https://caglrc.cc/~svo/glasstty/'
source=("https://caglrc.cc/~svo/glasstty/Glass_TTY_VT220.ttf")
md5sums=('7342d5c4c32ea4aa69c5d22d2f461fbb')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}

