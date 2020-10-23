#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=bdf-curie
_gitname=curie
pkgver=1.2
pkgrel=3
pkgdesc='A slightly upscaled version of scientifica'
arch=('any')
url="https://github.com/NerdyPepper/curie"
license=('OFL')
depends=()
makedepends=('git')
source=('git+https://github.com/NerdyPepper/curie.git')
sha256sums=('SKIP')

package() {
    install -D -m644 "$srcdir/$_gitname/regular/curieMedium-12.bdf" "$pkgdir/usr/share/fonts/misc/curieMedium-12.bdf"
    install -D -m644 "$srcdir/$_gitname/bold/curieBold-12.bdf" "$pkgdir/usr/share/fonts/misc/curieBold-12.bdf"
    install -D -m644 "$srcdir/$_gitname/italic/curieItalic-12.bdf" "$pkgdir/usr/share/fonts/misc/curieItalic-12.bdf"
    install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
