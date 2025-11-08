# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=mpls-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Markdown Preview Language Server"
provides=('mpls')
conflicts=('mpls')
arch=('x86_64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mhersson/mpls/releases/download/v${pkgver}/mpls_${pkgver}_linux_amd64.tar.gz")
sha256sums=('2fe53c3a2a36664aaffbe291a524f459501d98004f57a5f31a2d5f8d528fc185')

package() {
    install -Dm 755 "$srcdir/mpls" "$pkgdir/usr/bin/mpls"
}
