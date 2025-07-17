# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgbase=ttf-lilex
pkgname=(ttf-lilex ttf-lilex-variable)
pkgver=2.601
pkgrel=1
license=(OFL-1.1)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Lilex.zip")
b2sums=('29fe58dbc9b37afde69098b315fec95f863a747940e7ea629de49450c146e8bb99de68ff9fc96fc813f9a0bb8f1addd1330e8cd637bd8094f68a27121f7a1d8e')

package_ttf-lilex () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ttf/*.ttf
}

package_ttf-lilex-variable () {
	pkgdesc+=", variable version"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" variable/*.ttf
}
