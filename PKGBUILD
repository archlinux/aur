# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-guicolorscheme
pkgver=1.2
pkgrel=6
_scriptid=10162
pkgdesc='Auto convert gui-only colorschemes to 88/256 color terminal schemes'
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1809"
depends=('vim')
license=('GPL')
groups=('vim-plugins')
source=("guicolorscheme.vim::https://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
sha256sums=('a30e0c06617def9753a086b80c4c32bfe8fa2fbcd47a8bfc9cb1d9e2e87a4aba')

package() {
  install -Dm644 guicolorscheme.vim \
    "$pkgdir/usr/share/vim/vimfiles/plugin/guicolorscheme.vim"
}

# vim:set ts=2 sw=2 et:
