# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=otf-bravura
pkgver=1.271
pkgrel=1
pkgdesc='an SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url="http://www.smufl.org/fonts/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/steinbergmedia/bravura/archive/bravura-$pkgver.tar.gz")
sha256sums=('7568b2533c0747736398d81b6d03aa7d6cc6f4b064c16a301e155d9ebe6e1e5f')

package() {
    cd "$srcdir/bravura-bravura-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" redist/otf/*.otf
}
