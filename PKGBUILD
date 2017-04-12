# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2000
pkgver=1.171
pkgrel=3
pkgdesc="Unicode TT font with extensive glyph coverage"
arch=('i686' 'x86_64')
url="https://web.archive.org/web/20101122141939/http://code2000.net/"
license=('custom')
depends=(
    'fontconfig'
    'xorg-fonts-encodings'
    'xorg-mkfontscale'
    'xorg-mkfontdir'
)
source=(
    'https://web.archive.org/web/20101122142710/http://code2000.net/CODE2000.ZIP'
    'fontconfig-ttf.hook'
)
md5sums=(
    '1fa4e4b61d7ac0980b038e9260667a77'
    '91867dbfdbc2df620f596e8bc5ba908f'
)

package() {
  install -D -m644 CODE2000.TTF "$pkgdir/usr/share/fonts/TTF/Code2000.ttf"
  install -D -m644 CODE2000.HTM "$pkgdir/usr/share/licenses/ttf-code2000/Code2000.html"
  install -D -m644 "fontconfig-ttf.hook" "${pkgdir}/usr/share/libalpm/hooks/fontconfig-ttf.hook"
}
