# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=vim-sleuth
pkgver=1.1
pkgrel=1
pkgdesc="Vim plugin to heuristically set tabstop options"
arch=('any')
url="https://www.vim.org/scripts/script.php?script_id=4375"
license=('custom:vim')
depends=()
options=()
source=(
  "sleuth.zip::https://www.vim.org/scripts/download_script.php?src_id=19409"
)
sha256sums=('e35427b0b4e4b30682d5561e158f5d9b8df8784e43a3c77c44d085b27d87d9b4')

package() {
  cd "${srcdir}"
  install -Dm644 doc/sleuth.txt "${pkgdir}"/usr/share/vim/vimfiles/doc/sleuth.txt
  install -Dm644 plugin/sleuth.vim "${pkgdir}"/usr/share/vim/vimfiles/plugin/sleuth.vim
}
