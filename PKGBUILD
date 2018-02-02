# Maintainer: Genki Sky <sky at genki dot is>

pkgname=tla-toolbox
pkgver=1.5.6
pkgrel=1
pkgdesc='IDE for the TLA+ tools'
arch=('x86_64')
url='http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html'
license=('MIT')
depends=('java-runtime')
source=("https://tla.msr-inria.inria.fr/tlatoolbox/products/TLAToolbox-$pkgver-linux.gtk.x86_64.zip")
sha256sums=('72d301f32fa222f994c3e16c87724b20eacf0f1e2e06471e0c1d6c7d1a71baac')

package() {
    mkdir -p "$pkgdir"/usr/share/java/tla-toolbox
    cp -r toolbox/* "$pkgdir"/usr/share/java/tla-toolbox/
    mkdir -p "$pkgdir"/usr/bin
    ln -s '/usr/share/java/tla-toolbox/toolbox' "$pkgdir"/usr/bin/tla-toolbox
}
