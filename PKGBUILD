pkgname=sfnx
pkgver=0.0.4
pkgrel=1
pkgdesc="A minimal terminal-based password manager"
arch=('x86_64')
url="https://github.com/themohitnair/sfnx"
license=('MIT')
source=("sfnx-${pkgver}.tar.gz::https://github.com/themohitnair/sfnx/releases/download/v${pkgver}/sfnx-${pkgver}-linux-x86_64.tar.gz")
sha256sums=("ba7ed00aa7d506ac44baac3c4214e60a39fd94ee8da75ba564a75d8ee661c275")

package() {
    install -Dm755 "$srcdir/sfnx" "$pkgdir/usr/bin/sfnx"
}