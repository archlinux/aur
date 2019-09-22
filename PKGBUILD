# Maintainer: Francis Agyapong <francisagyapong2 at gmail dot com>

pkgname="ttf-courier-prime-code"
pkgdesc="Code-optimized Sans for programmers"
pkgver=20190922
pkgrel=1
provides=("${pkgname}")
arch=("any")
url="https://quoteunquoteapps.com/courierprime"
licence=("OFL")
source=("https://quoteunquoteapps.com/courierprime/downloads/courier-prime-code.zip")
sha256sums=("c400b6addeddef7c26a9943f847a8584c83d8bb775cd35da2dcd41c6ad98d827")

package() {
	install -Dm 644 "$srcdir/ttf/Courier Prime Code.ttf" -T "${pkgdir}/usr/share/fonts/TTF/CourierPrimeCode.ttf"
	install -Dm 644 "$srcdir/ttf/Courier Prime Code Italic.ttf" -T "${pkgdir}/usr/share/fonts/TTF/CourierPrimeCode-Italic.ttf"
}
