# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-css3
pkgver=1.10.0
pkgrel=1
pkgdesc="CSS3 syntax support for Vim's built-in syntax/css.vim"
arch=('any')
url="https://github.com/hail2u/vim-css3-syntax"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ac98547115c378590c7d3494708049bf0500161bce622004c84aa917ce05485')

package() {
	cd "vim-css3-syntax-$pkgver"
	find after -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
