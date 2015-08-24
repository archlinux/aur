# Maintainer: Carl George < arch at cgtx dot us >

_plugin="comments"
_script_id="1528"
_src_id="9801"
pkgname="vim-${_plugin}"
pkgver="2.12"
pkgrel="1"
pkgdesc="Vim plugin to comment and un-comment lines in different source files"
arch=("any")
url="http://www.vim.org/scripts/script.php?script_id=${_script_id}"
license=("unknown")
depends=("vim>=7.0")
install="vimdoc.install"
source=("${_plugin}.vim::http://www.vim.org/scripts/download_script.php?src_id=${_src_id}")
sha256sums=("2f8e28280d1146b41fd0306c862cad70cc75b5520eb71302dcf4c7734663b3e6")

package() {
    install -Dm0644 "${_plugin}.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/${_plugin}.vim"
}
