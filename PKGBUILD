# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=go-crane-bin
pkgver=0.12.1
pkgrel=1
pkgdesc='crane is a tool for interacting with remote images and registries.'
url='https://github.com/google/go-containerregistry'
license=('Apache')
arch=('x86_64')
provides=('crane')
source=("crane-$pkgver-$pkgrel.tar.gz::https://github.com/google/go-containerregistry/releases/download/v$pkgver/go-containerregistry_Linux_$arch.tar.gz")
sha256sums=('77a0d37334e5323e8ad08a02d6df0170cd3f0af491643cd15a98749a810de3d6')

package() {
    tar xzf $srcdir/crane-$pkgver-$pkgrel.tar.gz
    install -Dm 755 "$srcdir/crane" "$pkgdir/usr/bin/crane"
    install -Dm 755 "$srcdir/gcrane" "$pkgdir/usr/bin/gcrane"
}
