# Maintainer: A. Husen <hi@husen.id>
pkgname=plenti-bin
_pkgname=plenti
pkgver=0.5.12
pkgrel=1
pkgdesc="Static Site Generator with Go backend and Svelte frontend"
arch=('x86_64')
url="https://github.com/plentico/plenti"
license=('APACHE')
provides=('plenti')
conflicts=('plenti')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/plenti_${pkgver}_Linux_64-bit.tar.gz")
sha512sums=('b2f9a46ad226826edb3b01b995753b0bad53b94d36755984d6482aa4db5bb21d8f9449e3884246b48d22b411f99ce041bdcdf710341ff49803c0fc9030e28acb')

package() {
    cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md"		"$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"		"$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
