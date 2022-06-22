# Maintainer: A. Husen <hi@husen.id>
pkgname=plenti-bin
_pkgname=plenti
pkgver=0.5.8
pkgrel=1
pkgdesc="Static Site Generator with Go backend and Svelte frontend"
arch=('x86_64')
url="https://github.com/plentico/plenti"
license=('APACHE')
provides=('plenti')
conflicts=('plenti')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/plenti_${pkgver}_Linux_64-bit.tar.gz")
sha512sums=('348f0580cb5e5a03708ce63f5bcf0262c732488c8d97658110cd76012ffa46372fe4d5b930428d62fde61fea9031ad9d0179d5a3b5607d443979c0382615b4d1')

package() {
    cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md"		"$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"		"$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
