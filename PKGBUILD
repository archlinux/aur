# Maintainer: Samuel Sloniker <sam@kj7rrv.com>
pkgname=vim-is-neovim
pkgver=1.0.0
pkgrel=1
pkgdesc="Create symlink from vim -> nvim"
arch=("any")
depends=('neovim')
provides=('vim')
conflicts=('vim')

package() {
    mkdir -p $pkgdir/usr/bin/
    ln -s /usr/bin/nvim $pkgdir/usr/bin/vim
}
