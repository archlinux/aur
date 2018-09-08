# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Rhinoceros <aurarchlinux@plast.id.au>

pkgname=vim-undotree
pkgver=6.0
pkgrel=1
pkgdesc='Display your undo history in a graph.'
arch=(any)
url='https://github.com/mbbill/undotree'
license=(BSD)
depends=(vim)
groups=(vim-plugins)
source=("${pkgname}.tar.gz::https://github.com/mbbill/undotree/archive/rel_${pkgver}.tar.gz")
sha256sums=('27f11e6ea1760957352dd3d4b79e9da7b5a61a4ffe0680c1700a8016a8ee4534')

package() {
  cd "${srcdir}/undotree-rel_${pkgver}"
  install -Dm644 autoload/undotree.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/autoload/undotree.vim
  install -Dm644 plugin/undotree.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/plugin/undotree.vim
  install -Dm644 syntax/undotree.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/syntax/undotree.vim
  install -Dm644 README.md \
    "${pkgdir}"/usr/share/doc/vim-undotree/README.md
}

# vim:set ts=2 sw=2 et:
