# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Variable fonts based on the Commodore 64 and Amiga fonts'
pkgbase=homecomputer-fonts
pkgname=(ttf-homecomputer-workbench ttf-homecomputer-sixtyfour)
pkgver=2.2
pkgrel=1
url=https://github.com/jenskutilek/homecomputer-fonts
license=(OFL)
arch=(any)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('84e9396ccd582a1e267e066155af57e913ac6491290f271682c8f3581ccb3b055408921492ca3c332c2263b9ba11c20e93cacaf7b0c93ad7364e3bd6eff75590')

package_ttf-homecomputer-workbench () {
	pkgdesc='Variable font based on the Amiga system font'
	install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" \
		"$pkgbase-$pkgver/Workbench/fonts/variable"/*.ttf
}

package_ttf-homecomputer-sixtyfour () {
	pkgdesc='Variable font based on the Commodore 64 system font'
	install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" \
		"$pkgbase-$pkgver/Sixtyfour/fonts/variable"/*.ttf
}
