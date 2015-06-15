# Maintainer: jorge_barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-buftabs
pkgver=0.18
_src_id=15439
pkgrel=2
pkgdesc='Minimalistic buffer tabs saving screen space'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=1664'
license=('GPL')
depends=('vim')
groups=('vim-plugins')
source=("buftabs.vim::http://www.vim.org/scripts/download_script.php?src_id=$_src_id")
sha1sums=('79c30cd42602681182fdd2667b779bb823695455')

package() {
  install -Dm644 buftabs.vim "${pkgdir}"/usr/share/vim/vimfiles/plugin/buftabs.vim
}

# vim:set ts=2 sw=2 et:
