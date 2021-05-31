# Maintainer: A. Husen <hi@husen.id>
pkgname=plenti-bin
_pkgname=plenti
pkgver=0.4.21
pkgrel=1
pkgdesc="Static Site Generator with Go backend and Svelte frontend"
arch=('x86_64')
url="https://github.com/plentico/plenti"
license=('APACHE')
provides=('plenti')
conflicts=('plenti')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/plenti_${pkgver}_Linux_64-bit.tar.gz")
sha512sums=('a9d6afac3e58f3f9613970f723ed4bb39700719cf6de885c31a2de49e769692d40c32f66876d17aa01c1cee5440ad3f1bcac60c8dee2c02a0cb39a93a63a8438')

package() {
    cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md"		"$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"		"$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
