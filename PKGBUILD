# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=mpls-bin
_pkgname=${pkgname%-bin}
pkgver=0.21.3
pkgrel=1
pkgdesc="Markdown Preview Language Server"
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mhersson/mpls/releases/download/v${pkgver}/mpls_${pkgver}_linux_amd64.tar.gz")
sha256sums=('df87128f45da5f6f2bde6811159aec94d6262eb3d8583cbe7a3e8fa001dcbf8a')

package() {
    install -Dm 755 "$srcdir/mpls" "$pkgdir/usr/bin/mpls"
}
