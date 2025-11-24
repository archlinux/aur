# Maintainer: Nis Donatzsky Hansen <nis at donatzsky dot eu>
pkgname=(otf-fixel-text otf-fixel-display ttf-fixel-variable)
pkgbase=fixel-font
pkgver=1.21
pkgrel=1
pkgdesc='Grotesque sans typeface with a human touch by MacPaw'
arch=(any)
url="https://fixel.macpaw.com"
license=(OFL-1.1)
source=(
	"https://fonts.macpaw.com/fonts/FixelAll.zip"
	"https://openfontlicense.org/documents/OFL.txt"
)
sha512sums=(
	'49b06cf51b45601c7f2170a785cbf93aeb72fce7586f7aea9957d3214382c06a15807ac8be0d307b10175ef1f429b75f96716abe50964b9ad93c02f6de64e4b8'
	'2d0dfbba4d6a6ca9c27379ec1be0fcf86f801315ece6db5992140f3d524bcec65cd93acd61cbdc064d383aa86a9830fbe6709c5ee00c5f33c8c809e0ba2c6828'
)

package_otf-fixel-display() {
	pkgdesc+=' (display)'
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/fixel" FixelDisplay/*.otf
}

package_otf-fixel-text() {
	pkgdesc+=' (text)'
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/fixel" FixelText/*.otf
}

package_ttf-fixel-variable() {
	pkgdesc+=' (variable version)'
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/fixel" FixelVariable/*.ttf
}
