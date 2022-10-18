# Maintainer: Bojan Milevski <boyanmilevskix@gmail.com>
pkgname='ttf-macedonian-ancient'
pkgver=1.0.0
pkgrel=1
pkgdesc="Macedonian Ancient Font"
arch=('any')
url="https://www.ffonts.net/Macedonian-Ancient.font"
license=('unknown')
makedepends=('unzip')
source=("https://www.ffonts.net/Macedonian-Ancient.font.zip")
cksums=('2325067995' '21836')
md5sums=('ab8c1102b7badeb1b6848cc0dec67e3e')
sha1sums=('f0b46e12972eee761d53ca070a84e2c15e7da957')
sha256sums=('50b014c7daaf6111f5af06e76d5548e6e185d1f6eef2216da5d21a4b6d190f01')
sha224sums=('ad4a406d11e2bb405b862e4f292047f649490177b59ad7b244e4e800')
sha384sums=('84c1b49a04eb686d7df94727c8059b1e4f246e3e2afd8d2c0db9d94f2b557fccb230a3a153468c07dad0434a3e2290dd')
sha512sums=('8ed8e85471ac5f6b47f82f5efe2b4096b327d8dea5171c7b1a0ab8a37ad6a43cdf4766e8161c0c1f9eeb8e0fa2742c5f43df285bba8cd65e1d0fe427752d8144')
b2sums=('2ab9572dd331b650e390988c2ca66cefac0e1de36eda1358705c088a139004cb450be3af46eb52bac89b746c729f108c815847cd580c54fb60dbaf5efd872a0a')

prepare()
{
	unzip "${srcdir}/Macedonian-Ancient.font.zip" -d "${srcdir}/Macedonian_Ancient"
}

package()
{
	cd "${srcdir}/Macedonian_Ancient"

	install -Dm644 "m-ancin.ttf" "${pkgdir}/usr/share/fonts/TTF/Macedonian-Ancient.ttf"
}
