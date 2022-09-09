# Maintainer: Paulo Diovani <paulo@diovani.com>
pkgname=neovim-vim-compat
pkgver=0.1.0
pkgrel=2
pkgdesc='Vim compatibility for neovim. Symlinks vim to nvim and installs xxd.'
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
