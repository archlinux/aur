# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-nerdtree-syntax-highlight
pkgver=0.1.1
pkgrel=1
pkgdesc='Extra syntax and highlight for nerdtree files'
arch=('any')
url='https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
license=('GPL')
depends=('vim' 'vim-devicons' 'vim-nerdtree-git')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/archive/v${pkgver}.tar.gz")
sha512sums=('ded7922ecd98be7cea26c4c794105f4055688f6e6b882bc235e9b3ab50a703c6f00a4f16a5898cf523877876bd706b82cb875e5dbda7501f64de56b54b398ff7')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0644 'after/syntax/nerdtree.vim' "${pkgdir}/usr/share/vim/vimfiles/after/syntax/nerdtree.vim"
}

# vim:set et sw=2 ts=2 tw=79:
