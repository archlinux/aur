# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=vim-rec
pkgver=0.0.5
pkgrel=1
pkgdesc='GNU Recutils syntax highlighting support for Vim'
arch=('any')
url='https://github.com/zaid/vim-rec'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a2d2c76c8913c61a4276788bdde570869c923fe776c206458229c823544571aa')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  cp -a ./*/ -t "$pkgdir/usr/share/vim/vimfiles"
}
