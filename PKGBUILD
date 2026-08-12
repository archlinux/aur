# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=mpls-bin
_pkgname=${pkgname%-bin}
pkgver=0.22.0
pkgrel=1
pkgdesc="Markdown Preview Language Server"
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mhersson/mpls/releases/download/v${pkgver}/mpls_${pkgver}_linux_amd64.tar.gz")
sha256sums=('11273fa45ab1aabf0d177528e26f7e62819be2e6d0317c18f2deed174e656894')

package() {
    install -Dm 755 "$srcdir/mpls" "$pkgdir/usr/bin/mpls"
}
