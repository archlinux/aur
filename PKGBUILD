# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2000
pkgver=1.171
pkgrel=5
pkgdesc="Unicode TT font with extensive glyph coverage"
arch=('any')
url="https://web.archive.org/web/20101122141939/http://code2000.net/"
license=('custom')
depends=(
    'fontconfig'
    'xorg-fonts-encodings'
    'xorg-mkfontscale'
    'xorg-mkfontdir'
)
source=('https://web.archive.org/web/20101122142710/http://code2000.net/CODE2000.ZIP')
md5sums=('1fa4e4b61d7ac0980b038e9260667a77')
sha256sums=('af00db49179aaea66494a6b9cad3ae7f2b822bf650df3133c07f9c3209cbc8e2')
sha512sums=('754e278752fd24d2dbf28042ebd9598a456246f864db9213248b735a98ad787e2a7ec473a5c55edbf5e504af7f01dac807430e8fabc401be4d6ef4089b138c00')

package() {
  install -D -m644 CODE2000.TTF "$pkgdir/usr/share/fonts/TTF/Code2000.ttf"
  install -D -m644 CODE2000.HTM "$pkgdir/usr/share/licenses/ttf-code2000/Code2000.html"
}
