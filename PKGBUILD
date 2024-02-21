# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2000
pkgver=1.176
pkgrel=2
pkgdesc="Unicode TT font with extensive glyph coverage"
arch=('any')
url="https://www.code2001.com/"
license=('custom')
source=("CODE2000-$pkgver.ZIP::https://code2001.com/CODE2000.ZIP")
md5sums=('e96eb5860c23cd2d087a25a850f021ad')
sha256sums=('b53cf8a77d9aa192f86ca5879e46310b45446a0deb38d96cadb2d9e0f2fbaa75')
sha512sums=('fb55daf9c7d2b5c0ab15e4e41f64c0cc00c63b1f67d41c8840a504e1c8f90541f019bd2c2756dffa4b66df99b696facddc59562b05e06f7c2f61e53cd07a675b')

package() {
  install -D -m644 CODE2000.TTF "$pkgdir/usr/share/fonts/TTF/Code2000.ttf"
  install -D -m644 CODE2000.HTM "$pkgdir/usr/share/licenses/ttf-code2000/Code2000.html"
}
