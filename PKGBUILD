# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2000
pkgver=1.171
pkgrel=4
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
source=(
    'https://web.archive.org/web/20101122142710/http://code2000.net/CODE2000.ZIP'
    'fontconfig-ttf.hook'
)
md5sums=(
    '1fa4e4b61d7ac0980b038e9260667a77'
    '91867dbfdbc2df620f596e8bc5ba908f'
)
sha256sums=(
    'af00db49179aaea66494a6b9cad3ae7f2b822bf650df3133c07f9c3209cbc8e2'
    '59a0a896bee06740562e2a351a1066ad84dfa78668dbbda66c983695a87da6fc'
)
sha512sums=(
    '754e278752fd24d2dbf28042ebd9598a456246f864db9213248b735a98ad787e2a7ec473a5c55edbf5e504af7f01dac807430e8fabc401be4d6ef4089b138c00'
    'c80d6f3b31a255e3fd9ec7ee30f31d78c43f2266cce8a56f7dc17cf5b8bf55a2220adb0c0df95cb9a04c773f26889cc3057ddc56fca0622de03225fe9b3827be'
)

package() {
  install -D -m644 CODE2000.TTF "$pkgdir/usr/share/fonts/TTF/Code2000.ttf"
  install -D -m644 CODE2000.HTM "$pkgdir/usr/share/licenses/ttf-code2000/Code2000.html"
  install -D -m644 "fontconfig-ttf.hook" "${pkgdir}/usr/share/libalpm/hooks/fontconfig-ttf.hook"
}
