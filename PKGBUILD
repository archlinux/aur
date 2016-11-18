# Maintainer: Genki Marshall <genki at genki dot is>

pkgname=tla-toolbox
pkgver=1.5.2
pkgrel=1
pkgdesc="IDE for the TLA+ tools"
arch=('x86_64')
url="http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html"
license=('MIT')
depends=('jre8-openjdk')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('https://tla.msr-inria.inria.fr/tlatoolbox/products/TLAToolbox-1.5.2-linux.gtk.x86_64.zip')
md5sums=('SKIP')

package() {
    mkdir -p "$pkgdir/opt/tla-toolbox"
    cp -r toolbox/* "$pkgdir/opt/tla-toolbox/"
    echo '>>> Note: IDE binary will be located at /opt/tla-toolbox/toolbox'
}
