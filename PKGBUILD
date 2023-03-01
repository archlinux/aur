# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=vim-sleuth
pkgver=2.0
pkgrel=1
pkgdesc="Vim plugin to heuristically set tabstop options"
arch=('any')
url="https://www.vim.org/scripts/script.php?script_id=4375"
license=('custom:vim')
depends=()
options=()
source=(
  "sleuth.zip::https://www.vim.org/scripts/download_script.php?src_id=28019"
)
sha256sums=('9f31bc4af972f9269a0524e7c0b6ddc495a3e992a3689fb8853093212ae4a977')

package() {
  cd "${srcdir}"
  install -Dm644 doc/sleuth.txt "${pkgdir}"/usr/share/vim/vimfiles/doc/sleuth.txt
  install -Dm644 plugin/sleuth.vim "${pkgdir}"/usr/share/vim/vimfiles/plugin/sleuth.vim
}
