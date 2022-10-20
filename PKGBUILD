# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=go-crane-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='crane is a tool for interacting with remote images and registries.'
url='https://github.com/google/go-containerregistry'
license=('Apache')
arch=('x86_64')
provides=('crane')
source=("crane-$pkgver-$pkgrel.tar.gz::https://github.com/google/go-containerregistry/releases/download/v$pkgver/go-containerregistry_Linux_$arch.tar.gz")
sha256sums=('bb52befc2879ff398c77e9f47005da6d38fd9a8c05536d6c45dd4f8040b5a79a')

package() {
    tar xzf $srcdir/crane-$pkgver-$pkgrel.tar.gz
    install -Dm 755 "$srcdir/crane" "$pkgdir/usr/bin/crane"
    install -Dm 755 "$srcdir/gcrane" "$pkgdir/usr/bin/gcrane"
}
