#Maintainer: Sam peters <dev at libertycloud dot de>
# Contributor: Dan McCurry <dan.mc at protonmail dot com>
pkgname=bgmn-bin
pkgver=4.2.23
pkgrel=3
pkgdesc="Rietveld refinement backend for Profex"
arch=('x86_64')
url="http://www.bgmn.de"
license=('GPL2')
groups=('science')
depends=('glibc')
provides=('bgmn')
conflicts=('bgmn')
sha256sums_x86_64=('6c987bacc9b1ef8b4bd6569f13f193f24c0d61b7c4a8dd2cdeaecdf9352fa6a6'
                   '983d405e7e9d34cb455ff1f3314539fbb9e69ba72aff5a4af8b0973f56679ea5')
source_x86_64=("https://profex.doebelin.org/wp-content/uploads/2017/12/bgmn-${pkgver}-x86_64.tar.gz"
			   "https://www.profex-xrd.org/wp-content/uploads/2022/10/BGMN-Templates-221011-MacLinux.tar.gz")

package() {
	mkdir -p "${pkgdir}/opt/${pkgname%-bin}"

	cp -R "${srcdir}/${pkgname%-bin}-${pkgver}/." \
		"${pkgdir}/opt/${pkgname%-bin}/"

	cp -R "${srcdir}/BGMN-Templates/." \
		"${pkgdir}/opt/BGMN-Templates/"
}
