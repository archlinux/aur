# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=go-crane-bin
pkgver=0.8.0
pkgrel=2
pkgdesc='crane is a tool for interacting with remote images and registries.'
url='https://github.com/google/go-containerregistry'
license=('Apache')
arch=('x86_64')
provides=('crane')
source=("crane-$pkgver-$pkgrel.tar.gz::https://github.com/google/go-containerregistry/releases/download/v$pkgver/go-containerregistry_Linux_$arch.tar.gz")
sha256sums=('e3f2116d2bdda1c2f2247ee2f13259d41986560d0a06a16831e37096d8ecec0e')

package() {
    tar xzf $srcdir/crane-$pkgver-$pkgrel.tar.gz
    install -Dm 755 "$srcdir/crane" "$pkgdir/usr/bin/crane"
    install -Dm 755 "$srcdir/gcrane" "$pkgdir/usr/bin/gcrane"
}
