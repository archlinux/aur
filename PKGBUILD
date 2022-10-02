# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-abbreviation-tips
pkgver=0.6.0
pkgrel=1
pkgdesc="Alias abbreviation tips for fish shell"
arch=('any')
url="https://github.com/gazorby/fish-abbreviation-tips"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a2c939e68157628542d51e3c08bffa3f7d5bb5cf4aca0a2bee971f9fc012a429')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 functions/*.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
	install -Dm644 conf.d/abbr_tips.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
