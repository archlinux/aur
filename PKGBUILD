# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2000
pkgver=1.171
pkgrel=3
pkgdesc="Unicode TT font with extensive glyph coverage"
arch=('i686' 'x86_64')
url="http://www.code2000.net"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings')
install=font.install
source=(ftp://ftp.tw.freebsd.org/pub/ports/distfiles/code2000-1.171/CODE2000.ZIP)
md5sums=('1fa4e4b61d7ac0980b038e9260667a77')

package() {
  install -D -m644 CODE2000.TTF "$pkgdir/usr/share/fonts/TTF/Code2000.ttf"
  install -D -m644 CODE2000.HTM "$pkgdir/usr/share/licenses/ttf-code2000/Code2000.html"
}
