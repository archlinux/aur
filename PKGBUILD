#Maintainer: YamashitaRen <lemaitre(dot)lotus(at)gmail(dot)com>
pkgname=geany-highlightselectedword
pkgver=r5
pkgrel=1
pkgdesc='It is a Geany plugin that high lights (highlights) the word that is currently selected in the editor. It works with geany-1.23.1. It also works with geany-1.24.1.'
url='http://geanyhighlightselectedword.sourceforge.net/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('geany')
source=('https://sourceforge.net/projects/geanyhighlightselectedword/files/GeanyHighlightSelectedWord.zip')
md5sums=('SKIP')

build() {
    cd $srcdir/GeanyHighlightSelectedWord/oneTwoFive
    make
}

package() {
    cd $srcdir/GeanyHighlightSelectedWord/oneTwoFive
    install -D GeanyHighlightSelectedWord.so "$pkgdir/usr/lib/geany/GeanyHighlightSelectedWord.so"
}
