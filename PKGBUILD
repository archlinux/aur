# Maintainer: Genki Sky <sky at genki dot is>

pkgname=tla-toolbox
pkgver=1.5.7
pkgrel=1
pkgdesc='IDE for the TLA+ tools'
arch=('x86_64')
url='http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html'
license=('MIT')
depends=('java-runtime')
source=("https://tla.msr-inria.inria.fr/tlatoolbox/products/TLAToolbox-$pkgver-linux.gtk.x86_64.zip")
sha256sums=('1b21a10041bafac78d43bf8c478e48c0156b6bd18b49782c502d9481fd827d25')

package() {
    mkdir -p "$pkgdir"/usr/share/java/tla-toolbox
    cp -r toolbox/* "$pkgdir"/usr/share/java/tla-toolbox/
    mkdir -p "$pkgdir"/usr/bin
    ln -s '/usr/share/java/tla-toolbox/toolbox' "$pkgdir"/usr/bin/tla-toolbox
}
