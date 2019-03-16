pkgname='groff-ru'
pkgdesc="Groff Russian language localization (hyphenation and mm/mon/me default variables)"
pkgver=1
pkgrel=0
arch=('any')
license=('GPL3')
depends=('groff')
source=('koi8-r.tmac' 'ruhyphal.tex.koi8-r' 'ru.tmac.koi8-r')
provides=('groff-ru')
sha256sums=('SKIP' 'SKIP' 'SKIP')

#build () {
  #./build
#}

package () {
    local dst=${pkgdir}/usr/lib/groff/site-tmac
    install -d "${dst}"
    cp "${srcdir}/koi8-r.tmac" "${dst}/" 
    cp "${srcdir}/ru.tmac.koi8-r" "${dst}/ru.tmac" 
    cp "${srcdir}/ruhyphal.tex.koi8-r" "${dst}/ruhyphal.tex" 
}

# vim:set ts=2 sw=2 et:
