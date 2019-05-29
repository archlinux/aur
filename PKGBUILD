# Maintainer: Hezekiah Michael < spiritomb at protonmail dot com>

pkgname=neovim-colors-brogrammer-git
pkgver=20190529
pkgrel=1
pkgdesc="A dark, colorful syntax highlighting theme."
arch=('any')
url="https://github.com/ErikBoesen/vim-brogrammer-theme"
license=('unknown')
makedepends=('git')
depends=('neovim')
source=("$pkgname::git://github.com/ErikBoesen/vim-brogrammer-theme.git")
sha256sums=('SKIP')

pkgver() {
    date +%Y%m%d 
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 $pkgdir/usr/share/nvim/runtime/colors
    install -Dm644 colors/* $pkgdir/usr/share/nvim/runtime/colors/
}
