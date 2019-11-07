# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Geometric neo-gothic humanist sans serif typeface'
pkgname=ttf-secuela
pkgver=1.4889dab
pkgrel=1
url=https://github.com/defharo/secuela-variable
license=(custom:OFL)
arch=(any)
source=("${pkgname}::git+${url}#commit=${pkgver##*.}")
sha512sums=(SKIP)

package () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" \
		"${pkgname}"/FONTS/TTF/*.ttf
	install -Dm644 "${pkgname}/OFL.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
