# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=otf-bravura
pkgver=1.380
pkgrel=1
pkgdesc='An SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url='https://www.smufl.org/fonts/'
license=('OFL')
source=("https://github.com/steinbergmedia/${pkgname#otf-}/archive/${pkgname#otf-}-$pkgver.tar.gz")
sha256sums=('469b76e221237e7204fe63c24a796c14c20d116ff7c2c50678e62434d9766fdb')

package() {
    cd "${pkgname#otf-}-${pkgname#otf-}-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" redist/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" redist/OFL*.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md redist/bravura-text.md redist/FONTLOG.txt
}
