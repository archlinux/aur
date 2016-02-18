# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-opengl
pkgver=1.5
pkgrel=1
pkgdesc='Vim syntax highlighting for OpenGL, OpenGLES & EGL'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=752'
_file='opengl.vim'
source=("${_file}::http://www.vim.org/scripts/download_script.php?src_id=7583")
sha1sums=('8cf57810d7a307cede2f28780224488bf711091e')

package() {
  install -Dm644 "${srcdir}/${_file}" "${pkgdir}"/usr/share/vim/vimfiles/syntax/"${_file}"
}
