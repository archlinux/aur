# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Rhinoceros <aurarchlinux@plast.id.au>

pkgname=vim-undotree
pkgver=6.1
pkgrel=1
pkgdesc='Display your undo history in a graph.'
arch=(any)
url='https://github.com/mbbill/undotree'
license=(BSD)
depends=(vim)
groups=(vim-plugins)
source=("${pkgname}.tar.gz::https://github.com/mbbill/undotree/archive/rel_${pkgver}.tar.gz")
sha256sums=('ab55e442be0eea4e3e22a08179086866f44d604e8a8132174e7c0d1166bcf42c')

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
