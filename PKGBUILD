# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=vim-rec
pkgver=0.0.3
pkgrel=2
pkgdesc='GNU Recutils syntax highlighting support for Vim'
arch=('any')
url='https://github.com/zaid/vim-rec'
# https://github.com/zaid/vim-rec/issues/4
license=('unknown')
groups=('vim-plugins')
depends=('vim')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f1f56e55aa4c04fbb4b80ae84e60347bf39114bb7ed3e89cf79f0ece669ce065')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  cp -a ./*/ -t "$pkgdir/usr/share/vim/vimfiles"
}
