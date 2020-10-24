#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=otb-curie
_gitname=curie
pkgver=1.3
pkgrel=1
pkgdesc='A slightly upscaled version of scientifica'
arch=('any')
url="https://github.com/NerdyPepper/curie"
license=('OFL')
depends=()
makedepends=('git')
source=('git+https://github.com/NerdyPepper/curie.git')
sha256sums=('SKIP')

package() {
    install -D -m644 "$srcdir/$_gitname/regular/curieMedium.otb" "$pkgdir/usr/share/fonts/misc/curieMedium.otb"
    install -D -m644 "$srcdir/$_gitname/bold/curieBold.otb" "$pkgdir/usr/share/fonts/misc/curieBold.otb"
    install -D -m644 "$srcdir/$_gitname/italic/curieItalic.otb" "$pkgdir/usr/share/fonts/misc/curieItalic.otb"
    install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
