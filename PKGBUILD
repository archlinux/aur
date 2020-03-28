# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Genki Sky <alt+archlinux.org@genki.is>

pkgname=tla-toolbox
pkgver=1.6.0
pkgrel=1
pkgdesc='IDE for the TLA+ tools'
arch=('x86_64')
url='http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html'
license=('MIT')
depends=('java-runtime')
source=("https://tla.msr-inria.inria.fr/tlatoolbox/products/TLAToolbox-$pkgver-linux.gtk.x86_64.zip")
md5sums=('efbe2965b4727f041be8ec78ff7f84f2')
sha1sums=('b0fca8d26568c5304b5e4d5ab40f3ffe1ed48ba1')
sha512sums=('f58ad74fe627f52d77687f29c2fa1d9d6f0039bc640f15b72ff0dea8c33ee590d7b7c7a8b32725503bc8d0ac845778ceb02ba75cf1ec5a93ce255f8bec878433')

package() {
    mkdir -p "$pkgdir/usr/share/java/tla-toolbox"
    cp -r toolbox/* "$pkgdir/usr/share/java/tla-toolbox/"
    mkdir -p "$pkgdir/usr/bin"
    ln -s '/usr/share/java/tla-toolbox/toolbox' "$pkgdir/usr/bin/tla-toolbox"
}
