# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="ttf-29lt-zarid-sans"
pkgver=2.000
pkgrel=1
epoch=1
pkgdesc="A Friendly & Direct Typeface"
arch=(
	"any"
)
url="https://www.29lt.com/product/29lt-zarid-sans"
license=(
	"custom"
)
depends=(
	"fontconfig"
)
makedepends=(
	"woff2"
)
source=(
	"https://v-fonts.com/assets/fonts/29LTZaridSansVar.woff2"
	"https://v-fonts.com/assets/fonts/29LTZaridSansSlantedVar.woff2"
	"LICENSE"
)
b2sums=(
	"fb3e3dc04f1af452ff2782b10bb540335bec0ef8ea23e76a0a6e6a8a83b280ebada46a11359dc3fd5c6af5eceecbd995241c9144626eac9d1ce31472557804cf"
	"d6e62d88b1d4702877a47f568b60b8b01ce24668203d73d8da939796b76ab950406e58ccc5836f1559e5970f3ac0fd68d00f07025e2c1606dc74e3cf0448272a"
	"a813c4882068b1c94972f454fec3808c967952fe65c01faa7e9fc3f1aef11153b3d0262b267a1fc537b8ffaf825831e03feefc3d4367ff36117e542a464e4bdd"
)

prepare()
{
	woff2_decompress 29LTZaridSansVar.woff2
	woff2_decompress 29LTZaridSansSlantedVar.woff2
}

package()
{
	install -D -m644 "29LTZaridSansVar.ttf" "$pkgdir/usr/share/fonts/TTF/29LTZaridSansVar.ttf"
	install -D -m644 "29LTZaridSansSlantedVar.ttf" "$pkgdir/usr/share/fonts/TTF/29LTZaridSansSlantedVar.ttf"
	
	install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
