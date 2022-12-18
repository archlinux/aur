# Maintainer: Stetsed <stetsed at protonmaildotcom>
# Thanks to Ultracoolguy for the package idear
pkgname=nvim-vim
pkgver=1
pkgrel=1
pkgdesc="A symlink for using Doas as a drop-in replacement to sudo"
arch=('any')
url="https://github.com/neovim/neovim"
license=('Apache 2.0')
depends=('neovim')
provides=('vim')
conflicts=('vim')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which nvim) "$pkgdir"/usr/bin/vim
}

