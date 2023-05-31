# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgbase=ttf-lilex
pkgname=(ttf-lilex ttf-lilex-variable)
pkgver=2.200
pkgrel=2
license=(custom:OFL)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${url}/releases/download/${pkgver}/Lilex.zip"
        "${url}/raw/master/LICENSE")
sha512sums=('371333ecfad5381ad4dc1323739cff8a3d2e40017e92bab16eae8a647a740dd22d60a3a931d00bd6f32ec0b48d531c7224f0e2c9881ad86de95d2415746e4d3c'
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
