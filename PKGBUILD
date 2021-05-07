# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-startuptime
pkgver=2.0.2
pkgrel=1
pkgdesc="Vim plugin for profiling Vim's startup time"
arch=('any')
url="https://github.com/dstein64/vim-startuptime"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77741d74e613adb1a5efb04a4a1bd5ce66baea1403697f300c6eafb1d791dfe5')

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 644 autoload/startuptime.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/"
  install -Dvm 644 doc/startuptime.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
  install -Dvm 644 plugin/startuptime.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
