# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgbase=ttf-lilex
pkgname=(ttf-lilex ttf-lilex-variable)
pkgver=2.510
pkgrel=1
license=(OFL-1.1)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${url}/releases/download/${pkgver}/Lilex.zip"
        "${url}/raw/master/LICENSE")
b2sums=('0c43fd4e4efde2c2022d013bba887a7acc77f7c4140df19b86c6e7eb441e640c516e6a7a4dc8444c3e790fdbc1c0dd8ea3f8dd1894689b1c6702a18db1cd3504'
        'd1d25182ed13733f821935c1653be983c73ac8ae5322e22b5f072090769878ca4c41de505f25e0b5b36b3c9aff7ac516b20c1f30e2ad144237db8ce7036e8a87')

package_ttf-lilex () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ttf/*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_ttf-lilex-variable () {
	pkgdesc+=", variable version"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" variable/*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
