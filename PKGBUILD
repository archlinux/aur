# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=mpls-bin
_pkgname=${pkgname%-bin}
pkgver=0.23.0
pkgrel=1
pkgdesc="Markdown Preview Language Server"
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mhersson/mpls/releases/download/v${pkgver}/mpls_${pkgver}_linux_amd64.tar.gz")
sha256sums=('83887b4df42e7e37a651c258b42345264c6a9f16be39849b454e68dbdb1f02df')

package() {
    install -Dm 755 "$srcdir/mpls" "$pkgdir/usr/bin/mpls"
}
