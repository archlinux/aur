# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-lexima
pkgver=1.2.0
pkgrel=1
pkgdesc="Vim plugin for auto-closing parentheses"
arch=('any')
url="https://github.com/cohama/lexima.vim"
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('79236c7cfe426cf28846c2f34dd48c7c34c13c79853f8f65d9453fcd97c38b3f')

package() {
	cd "lexima.vim-$pkgver"
	find autoload doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
