# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=otf-bravura
pkgver=1.320
_tag=6aa3a101b9d08e90cf8cd354264cf737a30e5c95
pkgrel=2
pkgdesc='An SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url='http://www.smufl.org/fonts/'
license=('OFL')
source=("$pkgname-$pkgver.zip::https://github.com/steinbergmedia/${pkgname/otf-}/archive/$_tag.zip")
sha256sums=('90b7c137e1726638f100d3170e3ad59a48f34352741e77adf641c072c201de78')

package() {
    cd "${pkgname/otf-}-$_tag"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" redist/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" redist/OFL*.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md redist/bravura-text.md redist/FONTLOG.txt
}
