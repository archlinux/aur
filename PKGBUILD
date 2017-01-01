# Maintainer: Daniel Lima <danielm@tinyhub.tk>

pkgname=autoenv_fish
pkgver=0.2.0
pkgrel=1
pkgdesc='Directory-based environments for fish shell'
url="https://github.com/loopbit/${pkgname}"
license=('MIT')
checkdepends=('fish')
source=(https://github.com/loopbit/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('ab31322a20bf7fb6915735193a4b9df3b755cb0d3fc5ca35ce371ffc26587125002b3bf4f1d5703fecc2f0c362476207f79576566638946da6ab974b195e27b7')
arch=('any')
install="${pkgname}.install"

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm644 activate.fish "${pkgdir}/usr/share/${pkgname}/activate.fish"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
