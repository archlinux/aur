# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname='vim-colorscheme-mustang'
pkgver=20080926
pkgrel=2
pkgdesc="Dark Vim colorscheme for coders. Supports GUI and terminal modes."
arch=('any')
url="http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484"
license=('custom')
depends=('vim-runtime')
source=('mustang.vim')
md5sums=('4ebb0d162c4e91638324dcf2fa52abfa')

package() {
  install -D -m644 "${srcdir}/mustang.vim" \
                   "${pkgdir}/usr/share/vim/vim74/colors/mustang.vim"
}

# vim:set ts=2 sw=2 et:
