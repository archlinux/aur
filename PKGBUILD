#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=curie-bdf
_gitname=curie
pkgver=1.0
pkgrel=1
pkgdesc='A slightly upscaled version of scientifica'
arch=('any')
url="https://file:///home/neve/.ArchLabs-homepage/index.htmlgithub.com/NerdyPepper/curie"
license=('OFL')
depends=('')
makedepends=('git' 'xorg-font-utils')
source=('git+https://github.com/NerdyPepper/curie.git')
sha256sums=('SKIP')

package() {
    install -D -m644 "$srcdir/$_gitname/regular/curieMedium-12.bdf" "$pkgdir/usr/share/fonts/misc/curieMedium-12.bdf"
    install -D -m644 "$srcdir/$_gitname/bold/curieBold-12.bdf" "$pkgdir/usr/share/fonts/misc/curieBold-12.bdf"
    install -D -m644 "$srcdir/$_gitname/italic/curieItalic-12.bdf" "$pkgdir/usr/share/fonts/misc/curieItalic-12.bdf"
    install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
