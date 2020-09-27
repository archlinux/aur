# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64')
url="https://github.com/muesli/duf"
license=('MIT')
provides=('duf')
conflicts=('duf')
source_x86_64=("$url/releases/download/v$pkgver/duf_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('33fd09fef3c2f9b4dbf53044d0c709943b2658f2094a799205553f447e9deed0')

package() {
    install -Dm755 "duf" "$pkgdir/usr/bin/duf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
