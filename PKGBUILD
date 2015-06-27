# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Rhinoceros <aurarchlinux@plast.id.au>

pkgname=vim-undotree
pkgver=5.0
pkgrel=1
pkgdesc='Display your undo history in a graph.'
arch=(any)
url='https://github.com/mbbill/undotree'
license=(BSD)
depends=(vim)
groups=(vim-plugins)
source=("${pkgname}.tar.gz::https://github.com/mbbill/undotree/archive/rel_${pkgver}.tar.gz")
sha256sums=('57e49c1c819e53e340b9f76c639c4148ddaec88e050eb22095373dd051151cc7')

package() {
  cd "${srcdir}/undotree-rel_${pkgver}"
  install -Dm644 plugin/undotree.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/plugin/undotree.vim
  install -Dm644 syntax/undotree.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/syntax/undotree.vim
  install -Dm644 README.md \
    "${pkgdir}"/usr/share/doc/vim-undotree/README.md
}

# vim:set ts=2 sw=2 et:
