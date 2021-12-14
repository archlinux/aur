# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-asyncrun
pkgver=2.8.8
pkgrel=1
pkgdesc="Vim plugin for executing shell commands asynchronously"
arch=('any')
url="https://github.com/skywind3000/asyncrun.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('468b3beccdf38020eac55d551a0c1312bdc147998bc0713fdccabe633fab8b46')

package() {
	cd "asyncrun.vim-$pkgver"
	install -Dm644 plugin/asyncrun.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
	install -Dm644 doc/asyncrun.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
