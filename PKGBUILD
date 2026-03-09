# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-abbreviation-tips
pkgver=0.7.0
pkgrel=1
pkgdesc="Alias abbreviation tips for fish shell"
arch=('any')
url="https://github.com/gazorby/fish-abbreviation-tips"
license=('MIT')
groups=('fish-plugins')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('55a950f331410fc2690b868a2f0d409bd5e6441e4422c6dd0858f3f980cb0f5d')

package() {
    depends=('fish')
    cd "$pkgname-$pkgver"
    install -Dm644 functions/*.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
    install -Dm644 conf.d/abbr_tips.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
