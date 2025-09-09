# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgbase=ttf-lilex
pkgname=(ttf-lilex ttf-lilex-variable)
pkgver=2.610
pkgrel=1
license=(OFL-1.1)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Lilex.zip")
b2sums=('3890a9a3e8bea0e66efb42c8f43c51255cfa60c661fa4fce4f08c25177d9336154065528f98af518ba1dca11c86f8ab35313f30822c86f1df6b3235660ee77fb')

package_ttf-lilex () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ttf/*.ttf
}

package_ttf-lilex-variable () {
	pkgdesc+=", variable version"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" variable/*.ttf
}
