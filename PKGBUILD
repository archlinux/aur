# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-css3
pkgver=1.9.0
pkgrel=1
pkgdesc="CSS3 syntax support for Vim's built-in syntax/css.vim"
arch=('any')
url="https://github.com/hail2u/vim-css3-syntax"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('45d587c2111755372c3b60268251316df443f4b410ec0c7a039fce1ad10906c4')

package() {
	cd "vim-css3-syntax-$pkgver"
	find after -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
