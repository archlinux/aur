# Maintainer: Dan McCurry <dan.mc at protonmail dot com>
pkgname=bgmn-bin
pkgver=4.2.23
pkgrel=1
pkgdesc="Rietveld refinement backend for Profex"
arch=('x86_64')
url="http://www.bgmn.de"
license=('GPL2')
groups=('science')
depends=('glibc')
provides=('bgmn')
conflicts=('bgmn')
md5sums_x86_64=('b67b046872c398dc590f866187fd3920')
source_x86_64=("http://profex.doebelin.org/wp-content/uploads/2017/12/bgmn-${pkgver}-x86_64.tar.gz")

package() {
	mkdir -p "${pkgdir}/opt/${pkgname%-bin}"

	cp -R "${srcdir}/${pkgname%-bin}-${pkgver}/." \
		"${pkgdir}/opt/${pkgname%-bin}/"	
}
