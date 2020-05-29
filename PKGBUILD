# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Genki Sky <alt+archlinux.org@genki.is>

pkgname=tla-toolbox
pkgver=1.7.0
pkgrel=1
pkgdesc='IDE for the TLA+ tools'
arch=('x86_64')
url='http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html'
license=('MIT')
depends=('java-runtime')
source=("https://github.com/tlaplus/tlaplus/releases/download/v$pkgver/TLAToolbox-$pkgver-linux.gtk.x86_64.zip")
sha256sums=('a91c7d93ba7ecd490aed05da5988c7b6299ae279e0fbdbc97e34cdc642483f67')

package() {
    mkdir -p "$pkgdir/usr/share/java/tla-toolbox"
    cp -r toolbox/* "$pkgdir/usr/share/java/tla-toolbox/"
    mkdir -p "$pkgdir/usr/bin"
    ln -s '/usr/share/java/tla-toolbox/toolbox' "$pkgdir/usr/bin/tla-toolbox"
}
