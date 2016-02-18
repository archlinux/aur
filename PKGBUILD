# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-glsl
pkgver=1.10.00
pkgrel=1
pkgdesc='Vim syntax highlighting for the OpenGL Shading Language (GLSL)'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=1002'
_file='glsl.vim'
source=("${_file}::http://www.vim.org/scripts/download_script.php?src_id=3194")
sha1sums=('37a3284e31d1012e7fdcdc97b37dca4037137693')

package() {
  install -Dm644 "${srcdir}/${_file}" "${pkgdir}"/usr/share/vim/vimfiles/syntax/"${_file}"
}
