# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=mpls-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Markdown Preview Language Server"
provides=('mpls')
conflicts=('mpls')
arch=('x86_64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mhersson/mpls/releases/download/v${pkgver}/mpls_${pkgver}_linux_amd64.tar.gz")
sha256sums=('767387fa1a4bdecb67f2adf6c62f9dc7a2f526f7b966f19ca12901d22163c501')

package() {
    install -Dm 755 "$srcdir/mpls" "$pkgdir/usr/bin/mpls"
}
