# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=go-crane-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='crane is a tool for interacting with remote images and registries.'
url='https://github.com/google/go-containerregistry'
license=('Apache')
arch=('x86_64')
provides=('crane')
source=("crane-$pkgver-$pkgrel.tar.gz::https://github.com/google/go-containerregistry/releases/download/v$pkgver/go-containerregistry_Linux_$arch.tar.gz")
md5sums=('67e25128370e8f10b051cda7ede64f9c')

package() {
    tar xzf $srcdir/crane-$pkgver-$pkgrel.tar.gz
    install -Dm 755 "$srcdir/crane" "$pkgdir/usr/bin/crane"
    install -Dm 755 "$srcdir/gcrane" "$pkgdir/usr/bin/gcrane"
}
