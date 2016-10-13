# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=neovim-doxygentoolkit
pkgver=0.2.13
_scriptid=14064
pkgrel=1
pkgdesc="This script simplify doxygen documentation in C/C++"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=987"
license=('GPL')
depends=('neovim')
groups=('neovim-plugins')
source=(DoxygenToolkit.vim::"http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('669e14133afa26b2b72c48a9315d8f7d')
install='nvim-doc.install'

package() {
  cd "${srcdir}"
  install -D -m644 DoxygenToolkit.vim "${pkgdir}/usr/share/nvim/runtime/plugin/DoxygenToolkit.vim"
}
