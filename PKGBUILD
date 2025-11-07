# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgbase=ttf-lilex
pkgname=(ttf-lilex ttf-lilex-variable)
pkgver=2.621
pkgrel=1
license=(OFL-1.1)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Lilex.zip")
b2sums=('6f06fb30bf00cbb63ac3dd37d4ef4e22cd242e4883efdb5ad2fa40e80034df461be73ee7379fb10f73994e6f0fb1b8bccd5b81210dc02eab3efd36d6795d6a1b')

package_ttf-lilex () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ttf/*.ttf
}

package_ttf-lilex-variable () {
	pkgdesc+=", variable version"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" variable/*.ttf
}
