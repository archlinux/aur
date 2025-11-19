# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=(otf-commissioner ttf-commissioner ttf-commissioner-variable)
_reponame=Commissioner
pkgbase=commissioner-font
pkgver=1.012
pkgrel=1
pkgdesc='Sans typeface by Kostas Bartsokas'
arch=(any)
url="https://github.com/kosbarts/$_reponame"
license=(OFL-1.1-no-RFN)
source=("$url/releases/download/$pkgver/Commissioner_$pkgver.zip")
sha512sums=('44a81cdc55d1ec5cd0b1930a8dc6f21ff9025de3dea46ac7c1715cac007046fb343c379d8a2f3972d84137aa5e2e098a27d7f7c9e2ce911050d1e9a903a5cc8e')

package_otf-commissioner() {
	pkgdesc+=' (54 static cuts)'
	cd "${_reponame}_${pkgver}/Kostas_Bartsokas_Commissioner_$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/static/otfs/*.otf
}

package_ttf-commissioner() {
	pkgdesc+=' (54 static cuts)'
	cd "${_reponame}_${pkgver}/Kostas_Bartsokas_Commissioner_$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/static/ttfs/*.ttf
}

package_ttf-commissioner-variable() {
	pkgdesc+=' (variable version)'
	cd "${_reponame}_${pkgver}/Kostas_Bartsokas_Commissioner_$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/variable/*.ttf
}
