# Maintainer: Genki Sky <arch at genki dot is>

pkgname=tla-toolbox
pkgver=1.5.2
pkgrel=1
pkgdesc="IDE for the TLA+ tools"
arch=('i686' 'x86_64')
url='http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html'
license=('MIT')
depends=('java-runtime')
source=("https://tla.msr-inria.inria.fr/tlatoolbox/products/TLAToolbox-1.5.2-linux.gtk.$CARCH.zip")
md5sums=('a93f9ea07ca303d68f81f2be386f9c84')

package() {
    mkdir -p "$pkgdir"/usr/share/java/tla-toolbox
    cp -r toolbox/* "$pkgdir"/usr/share/java/tla-toolbox/
    mkdir -p "$pkgdir"/usr/bin
    ln -s '/usr/share/java/tla-toolbox/toolbox' "$pkgdir"/usr/bin/tla-toolbox
}
