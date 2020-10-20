# Maintainer: Stick <stick@stma.is>

pkgname=ttf-silkscreen
pkgver=1
pkgrel=2
pkgdesc='a typeface for your Web graphics created by Jason Kottke'
url='https://kottke.org/plus/type/silkscreen/'
arch=('any')
license=('custom')
source=('https://kottke.org/plus/type/silkscreen/download/silkscreen.zip'
	LICENSE)
sha256sums=('6e9a6b61d3540d5ea334d8c21f6c7edd2e479b8da10ebe2fb257829d156cb710'
	'ebc109078c06f79af74cf2b27454c262830d12a65749f0e2bf25d1ac1db7a02a')

package() {
	mkdir -p "$pkgdir"/usr/share/{fonts/TTF/,licenses/"$pkgname"}
	install -D -m0644 "$srcdir"/*.ttf "$pkgdir"/usr/share/fonts/TTF/
	install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/
}
