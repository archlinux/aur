# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=otf-bravura
pkgver=1.360
pkgrel=1
pkgdesc='An SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url='http://www.smufl.org/fonts/'
license=('OFL')
source=("https://github.com/steinbergmedia/${pkgname#otf-}/archive/${pkgname#otf-}-$pkgver.tar.gz")
sha256sums=('898e3f7b2ed3ba108e1daa1deaeb02ab9878a11b0e9436b8a737451f89a92a01')

package() {
    cd "${pkgname#otf-}-${pkgname#otf-}-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" redist/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" redist/OFL*.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md redist/bravura-text.md redist/FONTLOG.txt
}
