# Maintainer: lmartinez-mirror
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-nerdtree-syntax-highlight
pkgver=0.1.5
pkgrel=1
pkgdesc='Extra syntax and highlight for nerdtree files'
arch=('any')
url='https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
license=('GPL3')
depends=('vim-plugin-runtime' 'vim-devicons' 'vim-nerdtree')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('24e417c5b8af2a41d0f25664466f22e677a0e7f9322e12a469a45501d10bad7871547d6e55cccc547146e3a68c0747105a02d20b07ec0d68931a47f9f731bf86')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0644 'after/syntax/nerdtree.vim' "${pkgdir}/usr/share/vim/vimfiles/after/syntax/nerdtree.vim"
}

# vim:set et sw=2 ts=2 tw=79:
