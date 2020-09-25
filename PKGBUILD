# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64')
url="https://github.com/muesli/duf"
license=('MIT')
provides=('duf')
conflicts=('duf')
source_x86_64=("$url/releases/download/v$pkgver/duf_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('e45846fc872ac9fefadc851252e0fac7b8fe94d7a20ac44c1e495abc36c78dfb')

package() {
    install -Dm755 "duf" "$pkgdir/usr/bin/duf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
