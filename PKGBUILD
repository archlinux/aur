# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=otf-bravura
pkgver=1.204
pkgrel=2
pkgdesc='an SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url="http://www.smufl.org/fonts/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("http://www.smufl.org/files/bravura-$pkgver.zip")
sha256sums=('d9e13fa8be3185169ae761eee684ed3d1a6f2f32b7b861186da3610e462f0ee7')

package() {
    cd "otf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
}
