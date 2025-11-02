# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgbase=ttf-lilex
pkgname=(ttf-lilex ttf-lilex-variable)
pkgver=2.620
pkgrel=1
license=(OFL-1.1)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Lilex.zip")
b2sums=('d6a8ed08879e8ad3bb027be77268e7930d952b0ea4ff50ffae78f4b8d41e0bebda346d5aeea325f2d5f0eb3b07f9721cac10b1182099a82410062c934da434ff')

package_ttf-lilex () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ttf/*.ttf
}

package_ttf-lilex-variable () {
	pkgdesc+=", variable version"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" variable/*.ttf
}
