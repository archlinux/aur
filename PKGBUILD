# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=vim-rec
pkgver=0.0.4
pkgrel=1
pkgdesc='GNU Recutils syntax highlighting support for Vim'
arch=('any')
url='https://github.com/zaid/vim-rec'
# https://github.com/zaid/vim-rec/issues/4
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('371bdacc4d6497ae1a8a72063c6eaadbad4bcb5fd5c5955498c8776aa747f89a')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  cp -a ./*/ -t "$pkgdir/usr/share/vim/vimfiles"
}
