# Maintainer: A. Husen <hi@husen.id>
pkgname=plenti-bin
_pkgname=plenti
pkgver=0.5.0
pkgrel=1
pkgdesc="Static Site Generator with Go backend and Svelte frontend"
arch=('x86_64')
url="https://github.com/plentico/plenti"
license=('APACHE')
provides=('plenti')
conflicts=('plenti')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/plenti_${pkgver}_Linux_64-bit.tar.gz")
sha512sums=('1c129f5a84ad7b37beb7357a54e1944e8bdd6db7f432842eb7e881b3995112114ecde11e1ccb986a289f79623abcef2e503d3679240c0cc0efc8aadc057e2836')

package() {
    cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md"		"$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"		"$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
