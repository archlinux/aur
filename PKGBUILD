# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=vim-makejob
pkgver=1.2
pkgrel=1
pkgdesc="Minimal, asynchronous quickfix commands for Vim 8.0"
arch=('any')
url="https://github.com/djmoch/vim-makejob"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/djmoch/$pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('d39434ef822368ad149ff4f97b6de7a94c71f192ad05e85f1ebbb9b1cfea4272313b75d75844182f471e1c76f0ae096d097343c05a89d59016d34e94ae274507')

package() {
  cd $pkgname-$pkgver

  local installpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm644 doc/makejob.txt "$installpath/doc/makejob.txt"
  install -Dm644 plugin/makejob.vim "$installpath/plugin/makejob.vim"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
