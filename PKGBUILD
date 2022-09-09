# Maintainer: Paulo Diovani <paulo@diovani.com>
pkgname=neovim-vim-compat
pkgver=0.1.0
pkgrel=1
pkgdesc='Vim compatibility for neovim. Symlinks vim to nvim'
arch=('any')
url='https://neovim.io/'
license=('MIT')
depends=('neovim' 'xxd-standalone')
provides=('vim')
conflicts=('vim')
changelog='CHANGELOG'

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cd  "${pkgdir}/usr/bin"
  ln -s nvim vim
}
