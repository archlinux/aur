# Maintainer: Ainola
pkgname=vim-csound
pkgver=1
pkgrel=1
pkgdesc="Set of Tools for Editing Csound Files with Vim"
arch=('any')
url="http://www.eumus.edu.uy/docentes/jure/csound/vim/"
license=('custom')
groups=('vim-plugins')
depends=('vim')
optdepends=('csound')
install='vim-csound.install'
source=('http://www.eumus.edu.uy/docentes/jure/csound/vim/csound.vim.tar.gz')
sha256sums=('5b33db43e2d224d8d5fca92feeae5402e51e38575df28a5c58ceac2e3e6d1ecf')

package() {
  install -Dm 644 ${srcdir}/doc/csound.txt ${pkgdir}/usr/share/vim/vimfiles/doc/csound.txt
  install -Dm 644 ${srcdir}/ftdetect/csoundft.vim ${pkgdir}/usr/share/vim/vimfiles/ftdetect/csoundft.vim
  install -Dm 644 ${srcdir}/macros/csound_macros.vim ${pkgdir}/usr/share/vim/vimfiles/macros/csound_macros.vim
  install -Dm 644 ${srcdir}/syntax/csound.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/csound.vim
  install -Dm 644 ${srcdir}/syntax/csound_opcodes.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/csound_opcodes.vim
  install -Dm 644 ${srcdir}/templates/template.csd ${pkgdir}/usr/share/vim/vimfiles/templates/template.csd
}

#vim:set ts=2 sw=2 et:
