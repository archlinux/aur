pkgname=sfnx
pkgver=0.0.3
pkgrel=1
pkgdesc="A minimal terminal-based password manager"
arch=('x86_64')
url="https://github.com/themohitnair/sfnx"
license=('MIT')
source=("sfnx-${pkgver}.tar.gz::https://github.com/themohitnair/sfnx/releases/download/${pkgver}/sfnx-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/sfnx" "$pkgdir/usr/bin/sfnx"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}