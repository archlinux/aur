# Maintainer: A. Husen <hello@husen.id>
pkgname=plenti-bin
_pkgname=plenti
pkgver=0.4.19
pkgrel=1
pkgdesc="Static Site Generator with Go backend and Svelte frontend"
arch=('x86_64')
url="https://github.com/plentico/plenti"
license=('APACHE')
provides=('plenti')
conflicts=('plenti')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/plenti_${pkgver}_Linux_64-bit.tar.gz")
sha512sums=('bc4a7366a0fb60fbef75f6a7773a3f735421972a8a2b497c33cdff0a3ae4cd6bf039c2ac3f635e5c01516117ffd1126ac0dc0e46ac804dcb3b8d7396607a7797')

package() {
    cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md"		"$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"		"$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
