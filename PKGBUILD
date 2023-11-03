# Maintainer: Bojan Milevski <bojan@bojanmilevski.com>
pkgname='ttf-macedonian-church'
pkgver=1.0.1
pkgrel=1
pkgdesc="Macedonian Church Font"
arch=('any')
url="https://www.ffonts.net/Macedonian-Church.font"
license=('unknown')
makedepends=('unzip')
source=("https://www.ffonts.net/Macedonian-Church.font.zip")
sha512sums=('b2bbc9a11e93a1a313208f7048308b188a5427708611016131b30c5db33922e455b36fe705400db070ef9ddd9982b9d9afb8fd02ed82d0146cdbe769e0b3e493')

prepare()
{
	unzip "${srcdir}/Macedonian-Church.font.zip" -d "${srcdir}/Macedonian_Church"
}

package()
{
	cd "${srcdir}/Macedonian_Church"

	install -Dm644 "m-churn.ttf" "${pkgdir}/usr/share/fonts/TTF/Macedonian-Church.ttf"
}
