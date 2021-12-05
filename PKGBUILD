# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-startuptime
pkgver=3.1.1
pkgrel=1
pkgdesc="Vim plugin for profiling startup time"
arch=('any')
url="https://github.com/dstein64/vim-startuptime"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d283f75a6212cc0df5ac00c48ad697ea48199a165250b150fa6f8f18561f0867')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 autoload/startuptime.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/"
	install -Dm644 doc/startuptime.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm644 plugin/startuptime.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
