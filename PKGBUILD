# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=mpls-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Markdown Preview Language Server"
provides=('mpls')
conflicts=('mpls')
arch=('x86_64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mhersson/mpls/releases/download/v${pkgver}/mpls_${pkgver}_linux_amd64.tar.gz")
sha256sums=('174d5cc56e3efecf8db0fc365327bfcc76631dfe7cc80200f0814204bf677c3c')

package() {
    install -Dm 755 "$srcdir/mpls" "$pkgdir/usr/bin/mpls"
}
