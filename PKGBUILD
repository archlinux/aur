# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vim-misc-xolox
pkgver=1.17.4
pkgrel=2
_src_id=23119
pkgdesc='Miscellaneous auto-load Vim scripts'
arch=('any')
url='http://peterodding.com/code/vim/misc'
#url='http://www.vim.org/scripts/script.php?script_id=4597'
license=('MIT')
conflicts=(vim-misc-xolox-git)
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_src_id")
sha256sums=('ee1c5026afedf584db8bdd49e9020e9ab5cd3e2f05af34a75530b1737e6f1f88')
package(){
  cd "$srcdir"
  _vim_dir='/usr/share/vim/vimfiles'
  install -dm755 "$pkgdir"/$_vim_dir
  cp -r {autoload,doc,plugin} "$pkgdir"/$_vim_dir
}
