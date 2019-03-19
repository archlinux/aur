# Maintainer: Martin Tournoij <martin@arp242.net>
pkgname='aurgit'
pkgver='1.0'
pkgrel='1'
pkgdesc='A simple way to manage AUR packages'
arch=('any')
url='https://github.com/Carpetsmoker/aurgit'
license=('custom:MIT')
depends=('python>=3.5' 'git')

source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('71608022eb6ae13190c270df710f73398c208d069e93aed376d5070ac4ade4b115370911051be59569a68940077c98b11b98d1d2225ef5ad7d11785a02859b35')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dt "${pkgdir}/usr/bin/" "aurgit"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
