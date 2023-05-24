# Maintainer: Nazrin nazrin7693 at pm dot me

pkgname=vim-spell-is
pkgver=1
pkgrel=1
pkgdesc="Icelandic language files for Vim/Neovim spell checking"
arch=('any')
url="https://github.com/recette-lemon/vim-spell-is"
license=('MIT')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("git+https://github.com/recette-lemon/vim-spell-is")
sha256sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/vim/vimfiles/spell"
	install -Dm644 "vim-spell-is/is.utf-8.spl" "$pkgdir/usr/share/vim/vimfiles/spell"
}

