pkgname=sfnx
pkgver=0.0.4
pkgrel=1
pkgdesc="A minimal terminal-based password manager"
arch=('x86_64')
url="https://github.com/themohitnair/sfnx"
license=('MIT')
source=("sfnx-${pkgver}.tar.gz::https://github.com/themohitnair/sfnx/releases/download/v${pkgver}/sfnx-${pkgver}-linux-x86_64.tar.gz")
sha256sums=("d3b25646a2303b3c3219436cbe8d6c16ef129e2991fbfdc11f05ffa7ab3d89b2")

package() {
    install -Dm755 "$srcdir/sfnx" "$pkgdir/usr/bin/sfnx"
}