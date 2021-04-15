# Maintainer: A. Husen <hello@husen.id>
pkgname=plenti-bin
_pkgname=plenti
pkgver=0.4.16
pkgrel=2
pkgdesc="Static Site Generator with Go backend and Svelte frontend"
arch=('x86_64')
url="https://github.com/plentico/plenti"
license=('APACHE')
provides=('plenti')
conflicts=('plenti')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/plenti_${pkgver}_Linux_64-bit.tar.gz")
sha512sums=('b58d0b9de7aab5e7efdaa8f5b8297df187ec8566a6c3189e2ff86c49e03969b86415f3d0c4741bdcd7ff3b4b0eeb11d8c3971ca79f4bd040e8c1525f51b05796')

package() {
    cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md"		"$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"		"$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
