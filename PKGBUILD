# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=otf-bravura
pkgver=1.276
pkgrel=1
pkgdesc='an SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url="http://www.smufl.org/fonts/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/steinbergmedia/bravura/archive/bravura-$pkgver.tar.gz")
sha256sums=('1deeb9ff9cf754126dc8870421062719b75c1471f2588c580a1a557ca7523ab7')

package() {
    cd "$srcdir/bravura-bravura-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" redist/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" redist/OFL*.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md redist/bravura-text.md redist/FONTLOG.txt
}
