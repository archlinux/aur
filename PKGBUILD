# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=go-crane-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='crane is a tool for interacting with remote images and registries.'
url='https://github.com/google/go-containerregistry'
license=('Apache')
arch=('x86_64')
provides=('crane')
source=("crane-$pkgver-$pkgrel.tar.gz::https://github.com/google/go-containerregistry/releases/download/v$pkgver/go-containerregistry_Linux_$arch.tar.gz")
sha256sums=('fc21f1b3ac0c9503889683a51892f97bf02495d5d20154f1f8f8de6fb8b18ad0')

package() {
    tar xzf $srcdir/crane-$pkgver-$pkgrel.tar.gz
    install -Dm 755 "$srcdir/crane" "$pkgdir/usr/bin/crane"
    install -Dm 755 "$srcdir/gcrane" "$pkgdir/usr/bin/gcrane"
}
