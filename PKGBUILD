# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=ttf-open-sauce-sans
pkgdesc='Compact typeface optimized for small text on screen and print'
pkgver=1.474
pkgrel=2
license=(custom:OFL)
arch=(any)
url=https://github.com/marcologous/Open-Sauce-Sans
_commit=f47d508e52433f70e19c50feb6cea53242631274
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=(SKIP)

package () {
	cd "${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" TTF/*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" License/OFL.txt
}
