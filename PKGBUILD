# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer:

pkgname=vim-doxygentoolkit
pkgver=0.2.13
_scriptid=14064
pkgrel=5
pkgdesc="This script simplify doxygen documentation in C/C++"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=987"
license=('GPL')
depends=('vim')
groups=('vim-plugins')
source=(DoxygenToolkit.vim::"https://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
sha512sums=('af4e6f8dae1079ff8b497c4115e5e3759473bc86b2d589333ed504bd234b693430014417f5b12013ec4f62bf2055e4be66e6c352191aa15ed7ce27a117403dd7')

package() {
  cd "${srcdir}"
  install -D -m644 DoxygenToolkit.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/DoxygenToolkit.vim"
}
