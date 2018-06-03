#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=scientifica-bdf
_gitname=scientifica
pkgver=2.2
pkgrel=2
pkgdesc='Tall and condensed bitmap font for geeks.'
arch=('any')
url="https://github.com/NerdyPepper/scientifica"
license=('SIL')
depends=()
makedepends=('git' 'xorg-font-utils')
source=('git+https://github.com/NerdyPepper/scientifica.git')
sha256sums=('SKIP')

package() {
    install -D -m644 "$srcdir/$_gitname/regular/scientifica-11.bdf" "$pkgdir/usr/share/fonts/misc/scienfica-11.bdf"
    install -D -m644 "$srcdir/$_gitname/bold/scientificaBold-11.bdf" "$pkgdir/usr/share/fonts/misc/scienficaBold-11.bdf"
    install -D -m644 "$srcdir/$_gitname/italic/scientificaItalic-11.bdf" "$pkgdir/usr/share/fonts/misc/scienficaItalic-11.bdf"
    install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
