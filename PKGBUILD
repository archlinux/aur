# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Lukas Böger <dev  AT  lboeger  DOT  de>

pkgname=vim-quickscope
pkgver=2.5.10
pkgrel=1
pkgdesc='Highlight which characters to target for f, F and family'
arch=('any')
license=('MIT')
url='https://github.com/unblevable/quick-scope'
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('00d7b8561dba7059fcc61cf4f5e2163e9f508c9b1dd44c4a67afa69b19343e9b')
groups=('vim-plugins')

package() {
  cd "quick-scope-$pkgver"

  install -Dm644 autoload/quick_scope.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope.vim"
  install -Dm644 autoload/quick_scope/mapping.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope/mapping.vim"
  install -Dm644 autoload/quick_scope/lazy_print.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope/lazy_print.vim"
  install -Dm644 plugin/quick_scope.vim "$pkgdir/usr/share/vim/vimfiles/plugin/quick_scope.vim"
  install -Dm644 doc/quick-scope.txt "$pkgdir/usr/share/vim/vimfiles/doc/quick-scope.txt"
}
