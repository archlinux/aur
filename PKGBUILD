pkgname=sfnx
pkgver=0.0.5
pkgrel=1
pkgdesc="A minimal terminal-based password manager"
arch=('x86_64')
url="https://github.com/themohitnair/sfnx"
license=('MIT')
source=("sfnx-${pkgver}.tar.gz::https://github.com/themohitnair/sfnx/releases/download/v${pkgver}/sfnx-${pkgver}-linux-x86_64.tar.gz")
sha256sums=("53cadb1858d4ebee43fbc5efa4c585ad221dfd98cde4003b7d119485a78e4522")

package() {
    install -Dm755 "$srcdir/dist/sfnx" "$pkgdir/usr/bin/sfnx"
}