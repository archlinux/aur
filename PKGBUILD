# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=(otf-commissioner ttf-commissioner ttf-commissioner-variable)
_reponame=Commissioner
pkgbase=commissioner-font
pkgver=1.000
pkgrel=6
pkgdesc='Sans typeface by Kostas Bartsokas'
arch=(any)
url="https://github.com/kosbarts/$_reponame"
license=(OFL)
source=("$url/releases/download/$pkgver/Commissioner_$pkgver.zip")
sha512sums=('a1be692a076006e35a31c264bf5f7d8f0b0edc209714efc0986e08e8e4019db6300c8593b3e5ea8119c2a08217fabee248722fa04a00a02720d9e9f71ceb6d8a')

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
