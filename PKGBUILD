# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="otf-kawkab-mono"
pkgver=0.501
pkgrel=1
epoch=1
pkgdesc="A monospaced Arabic typeface"
arch=(
	"any"
)
url="http://makkuk.com/kawkab-mono"
license=(
	"custom"
)
source=(
	"https://github.com/aiaf/kawkab-mono/releases/download/v$pkgver/kawkab-mono-$pkgver.zip"
	)
b2sums=(
	"08fd51062404e045cbd27afd3c95150c7d477af295b4e6473eb9582c761151f12aee4c5665faec7cb93ce6f4a11b0da033250fe6631387d02be25bdc62d7eb66"
)

package()
{
	cd "kawkab-mono-$pkgver"
	install -D -m644 "KawkabMono-Regular.otf" "$pkgdir/usr/share/fonts/OTF/KawkabMono-Regular.otf"
	install -D -m644 "KawkabMono-Light.otf" "$pkgdir/usr/share/fonts/OTF/KawkabMono-Light.otf"
	install -D -m644 "KawkabMono-Bold.otf" "$pkgdir/usr/share/fonts/OTF/KawkabMono-Bold.otf"

	install -D -m644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
