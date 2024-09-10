# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgbase=ttf-lilex
pkgname=(ttf-lilex ttf-lilex-variable)
pkgver=2.530
pkgrel=1
license=(OFL-1.1)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Lilex.zip")
b2sums=('a2a857cd907189bc3ce0a820549c8dcf853aee87aeb5789281d50c9abd597c40df3b8dce87a4b9232c3d9b7cd2d94aa4ded8be1c0703f13ddcf4e8f52c606209')

package_ttf-lilex () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ttf/*.ttf
}

package_ttf-lilex-variable () {
	pkgdesc+=", variable version"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" variable/*.ttf
}
