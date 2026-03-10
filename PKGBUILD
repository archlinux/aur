# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=mpls-bin
_pkgname=${pkgname%-bin}
pkgver=0.20.1
pkgrel=1
pkgdesc="Markdown Preview Language Server"
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mhersson/mpls/releases/download/v${pkgver}/mpls_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ccd0f30ea59fc1ddb831aaa269fa419d627d855298f2d9181d53b5994e503f6e')

package() {
    install -Dm 755 "$srcdir/mpls" "$pkgdir/usr/bin/mpls"
}
