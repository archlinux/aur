# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=vim-sleuth
pkgver=1.2
pkgrel=1
pkgdesc="Vim plugin to heuristically set tabstop options"
arch=('any')
url="https://www.vim.org/scripts/script.php?script_id=4375"
license=('custom:vim')
depends=()
options=()
source=(
  "sleuth.zip::https://www.vim.org/scripts/download_script.php?src_id=27557"
)
sha256sums=('d0b3f5870778be8b5882e7ed957584105aac977ec2843c17f5f9b40e791b1108')

package() {
  cd "${srcdir}"
  install -Dm644 doc/sleuth.txt "${pkgdir}"/usr/share/vim/vimfiles/doc/sleuth.txt
  install -Dm644 plugin/sleuth.vim "${pkgdir}"/usr/share/vim/vimfiles/plugin/sleuth.vim
}
