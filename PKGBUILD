# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('otf-nasin-nanpa')
pkgver=2.5.1
pkgrel=1
pkgdesc="A font for the sitelen pona writing system in UCSUR space"
url="https://github.com/ETBCOR/nasin-nanpa"
license=('MIT')
source=("https://github.com/ETBCOR/nasin-nanpa/releases/download/n${pkgver}/nasin-nanpa-${pkgver}.otf"
	"https://github.com/ETBCOR/nasin-nanpa/raw/n${pkgver}/LICENSE")
b2sums=('0f462a8d4c8ac8ea4c80e72c4b29498b4811b9359354d1b65880944b26d2c921a4b27edddad811e227094f95b673b6c807ad8d0c42656c21af562e16333618e8'
	'a2227bd60b2a5034467d49a21025b619213a278b51fb3cdbd37c41ad0da4b630af86f01347dc63c0a6ed1e07c640619e75727a99e292aab66a352a780cc23396')
arch=('any')

package(){
	# Install license
	install -Dm644 -t "${pkgdir}"/usr/share/licenses/"${pkgname}" LICENSE

	# Install font
	install -Dm644 -t "${pkgdir}"/usr/share/fonts/OTF nasin-nanpa-"${pkgver}".otf
}
