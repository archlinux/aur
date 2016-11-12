# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-nerdtree-syntax-highlight
pkgver=0.1.0
pkgrel=1
pkgdesc='Extra syntax and highlight for nerdtree files'
arch=('any') 
url='https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
license=('GPL')
depends=('vim' 'vim-devicons' 'vim-nerdtree-git')
groups=('vim-plugins')
install="vimdoc.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/archive/v0.1.0.tar.gz")
sha512sums=('1197ca621d6534ececfa495ffb29fd96dfa1ffa8659ad726dfde1de61010676bb6e9b0fa77039d7963b06c23b7e9cfd9b3f4386ac03e6f45d8cb6021963c8df8')
            

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0644 'after/syntax/nerdtree.vim' "${pkgdir}/usr/share/vim/vimfiles/after/syntax/nerdtree.vim"
}

# vim:set et sw=2 ts=2 tw=79:
