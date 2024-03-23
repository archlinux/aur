# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgbase=ttf-lilex
pkgname=(ttf-lilex ttf-lilex-variable)
pkgver=2.400
pkgrel=1
license=(custom:OFL)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${url}/releases/download/${pkgver}/Lilex.zip"
        "${url}/raw/master/LICENSE")
sha512sums=('5155e3ddd8b209029d1e04fe8e8cb9618e34e8f98927948d48e100f799d384dc220ab14629a139d3fc904e0782b3c5bdade7f936fb38d7e153b50372f8dd0a60'
            '5d88057790605ea319fe03d9e327b5b3e3042bcb8ede02324a5a4a6f2cbc8039ce2c64b69c9fb7f3bbea0575779b6edfe717dec59395e652fe1fb1cc462056bb')

package_ttf-lilex () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ttf/*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_ttf-lilex-variable () {
	pkgdesc+=", variable version"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" variable/*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
