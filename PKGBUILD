# Maintainer: A. Husen <hello@husen.id>
pkgname=plenti-bin
_pkgname=plenti
pkgver=0.4.18
pkgrel=1
pkgdesc="Static Site Generator with Go backend and Svelte frontend"
arch=('x86_64')
url="https://github.com/plentico/plenti"
license=('APACHE')
provides=('plenti')
conflicts=('plenti')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/plenti_${pkgver}_Linux_64-bit.tar.gz")
sha512sums=('825e1d4705b9ee1057cceccbf8ff7f185a3ab4fa711197e0ddec1d74f911f1e328e1146d28e77791ccaadc524ffbb0f519d3f67a0abac79802b2dee3380b7b75')

package() {
    cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md"		"$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"		"$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
