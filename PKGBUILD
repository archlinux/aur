# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Julian Hauser <julian at julianhauser.com>

pkgbase=fonts-clarity-city
pkgname=(otf-clarity-city ttf-clarity-city)
pkgver=1.0.0
pkgrel=2
pkgdesc="A modern, geometric sans-serif font. Successor to Metropolis."
arch=('any')
url="https://github.com/vmware/clarity-city"
license=('custom:OFL')
source=("clarity-city-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9617b71c3f0bdd47cc4d054243cc2147d0b9a36ac7fd3606273bc7975f2af4b3')

package_otf-clarity-city() {
	provides=('otf-font')

	cd "clarity-city-$pkgver"
	install -Dm 644 OpenType/ClarityCity-*.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 NOTICE.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_ttf-clarity-city() {
	provides=('ttf-font')

	cd "clarity-city-$pkgver"
	install -Dm 644 TrueType/ClarityCity-*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 NOTICE.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
