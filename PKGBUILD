# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-vulkan
pkgver=1.0
pkgrel=1
pkgdesc='Vim syntax highlighting for the Vulkan API'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=5335'
_file='vulkan.vim'
source=("${_file}::http://www.vim.org/scripts/download_script.php?src_id=24017")
sha1sums=('1688cb5b6b9d11d4570167b93438f0ad0cb24b4e')

package() {
  install -Dm644 "${srcdir}/${_file}" "${pkgdir}"/usr/share/vim/vimfiles/syntax/"${_file}"
}
