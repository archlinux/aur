# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=otf-bravura
pkgver=1.392
pkgrel=1
pkgdesc='An SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url='https://www.smufl.org/fonts/'
license=('OFL')
source=("https://github.com/steinbergmedia/${pkgname#otf-}/archive/${pkgname#otf-}-$pkgver.tar.gz")
sha256sums=('42d18929af4cbdd13784a51c509175d4458010332d238310b4d4cd962e2bc1db')

package() {
    cd "${pkgname#otf-}-${pkgname#otf-}-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" redist/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" redist/OFL*.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md redist/bravura-text.md redist/FONTLOG.txt
}
