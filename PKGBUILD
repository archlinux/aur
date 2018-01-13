# Maintainer: Genki Sky <sky at genki dot is>

pkgname=tla-toolbox
pkgver=1.5.5
pkgrel=1
pkgdesc='IDE for the TLA+ tools'
arch=('x86_64')
url='http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html'
license=('MIT')
depends=('java-runtime')
source=("https://tla.msr-inria.inria.fr/tlatoolbox/products/TLAToolbox-$pkgver-linux.gtk.x86_64.zip")
sha256sums=('c05fc4f8ef38d0cd97a8b74eec08ba9d210929e1a6b5767a2d6d3c939b7c14d0')

package() {
    mkdir -p "$pkgdir"/usr/share/java/tla-toolbox
    cp -r toolbox/* "$pkgdir"/usr/share/java/tla-toolbox/
    mkdir -p "$pkgdir"/usr/bin
    ln -s '/usr/share/java/tla-toolbox/toolbox' "$pkgdir"/usr/bin/tla-toolbox
}
