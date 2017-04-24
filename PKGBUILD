# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: YamashitaRen <lemaitre(dot)lotus(at)gmail(dot)com>

pkgname=geany-highlightselectedword
pkgver=20160801
pkgrel=1
pkgdesc="Geany plugin that highlights the word that is currently selected in the editor"
url="https://sourceforge.net/projects/geanyhighlightselectedword/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('geany')
source=("https://downloads.sourceforge.net/project/geanyhighlightselectedword/GeanyHighlightSelectedWord_2016-08-01T00-53-19.zip")
md5sums=('91b9a703d3d0e6ec22c22908ce6e4e9b')

build() {
  cd "${srcdir}/GeanyHighlightSelectedWord_2016-08-01T00-53-19"
  make
}

package() {
  cd "${srcdir}/GeanyHighlightSelectedWord_2016-08-01T00-53-19"
  
  install -Dm644 GeanyHighlightSelectedWord.so \
    "${pkgdir}/usr/lib/geany/GeanyHighlightSelectedWord.so"
}

# vim:set ts=2 sw=2 cc=80 et:
