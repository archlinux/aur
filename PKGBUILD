# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=otf-bravura
pkgver=1.350
pkgrel=1
pkgdesc='An SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url='http://www.smufl.org/fonts/'
license=('OFL')
source=("https://github.com/steinbergmedia/${pkgname#otf-}/archive/${pkgname#otf-}-$pkgver.tar.gz")
sha256sums=('aec13cd75009e39b4c79c36ae6d9fbe49d44ba58a4ff5a508471e00040e6726a')

package() {
    cd "${pkgname#otf-}-${pkgname#otf-}-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" redist/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" redist/OFL*.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md redist/bravura-text.md redist/FONTLOG.txt
}
