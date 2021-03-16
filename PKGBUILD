# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=crane-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='crane is a tool for interacting with remote images and registries.'
url='"https://github.com/google/go-containerregistry'
license=('Apache')
arch=('x86_64')
provides=('metalctl')
source=("crane-$pkgver-$pkgrel.tar.gz::https://github.com/google/go-containerregistry/releases/download/v$pkgver/go-containerregistry_Linux_$arch.tar.gz")
md5sums=('a1e04a979a22c10c2cceafec5c3b00ae')

package() {
    tar xzf $srcdir/crane-$pkgver-$pkgrel.tar.gz
    install -Dm 755 "$srcdir/crane" "$pkgdir/usr/bin/crane"
    install -Dm 755 "$srcdir/gcrane" "$pkgdir/usr/bin/gcrane"
}
