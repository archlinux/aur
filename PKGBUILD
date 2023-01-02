# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=bd
pkgver=1.03
pkgrel=3
pkgdesc='Quickly go back to a parent directory instead of typing "cd ../../.." repeatedly'
url='https://github.com/vigneshwaranr/bd'
arch=('any')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2d9b8ce674e4a80452c119dc10efe184194fdf244abf1822dc7693796793c352')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 "bash_completion.d/${pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
