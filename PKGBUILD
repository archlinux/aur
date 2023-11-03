# Maintainer: Bojan Milevski <bojan@bojanmilevski.com>
pkgname='ttf-macedonian-ancient'
pkgver=1.0.1
pkgrel=1
pkgdesc="Macedonian Ancient Font"
arch=('any')
url="https://www.ffonts.net/Macedonian-Ancient.font"
license=('unknown')
makedepends=('unzip')
source=("https://www.ffonts.net/Macedonian-Ancient.font.zip")
sha512sums=('8ed8e85471ac5f6b47f82f5efe2b4096b327d8dea5171c7b1a0ab8a37ad6a43cdf4766e8161c0c1f9eeb8e0fa2742c5f43df285bba8cd65e1d0fe427752d8144')

prepare()
{
	unzip "${srcdir}/Macedonian-Ancient.font.zip" -d "${srcdir}/Macedonian_Ancient"
}

package()
{
	cd "${srcdir}/Macedonian_Ancient"

	install -Dm644 "m-ancin.ttf" "${pkgdir}/usr/share/fonts/TTF/Macedonian-Ancient.ttf"
}
