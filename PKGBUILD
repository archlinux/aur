# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modern programming font with ligatures'
pkgname=ttf-lilex
pkgver=1.100
pkgrel=1
license=(custom:OFL)
url=https://github.com/mishamyrt/Lilex
arch=(any)
source=("${url}/releases/download/${pkgver}/Lilex-${pkgver}.zip"
        "${url}/raw/master/LICENSE")
sha512sums=('cd768412a8032ce024cf59210a7f4ad3be51f137e6b598e394d992b1614f15cb9c3ad2c24d253b7a43b2c10937278e2bb17505f5739f4f973cc74991fe1f9c21'
            '5d88057790605ea319fe03d9e327b5b3e3042bcb8ede02324a5a4a6f2cbc8039ce2c64b69c9fb7f3bbea0575779b6edfe717dec59395e652fe1fb1cc462056bb')

package () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ttf/*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
