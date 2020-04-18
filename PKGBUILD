# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Lukas Böger <dev  AT  lboeger  DOT  de>

pkgname=vim-quickscope
pkgver=2.5.3
pkgrel=1
pkgdesc='Highlight which characters to target for f, F and family'
arch=('any')
license=('MIT')
url='https://github.com/unblevable/quick-scope'
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c9354f414cb26c3eb770dec18620379ad30fdfba8186fa20a363434fc66a5d03')
groups=('vim-plugins')

package() {
  cd "quick-scope-$pkgver"

  install -Dm644 autoload/quick_scope.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope.vim"
  install -Dm644 autoload/quick_scope/mapping.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope/mapping.vim"
  install -Dm644 autoload/quick_scope/lazy_print.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope/lazy_print.vim"
  install -Dm644 plugin/quick_scope.vim "$pkgdir/usr/share/vim/vimfiles/plugin/quick_scope.vim"
  install -Dm644 doc/quick-scope.txt "$pkgdir/usr/share/vim/vimfiles/doc/quick-scope.txt"
}
