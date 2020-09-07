# vim-visual-multi

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-visual-multi
pkgver=0.5.8
pkgrel=1
pkgdesc='Multiple cursors plugin for vim/neovim'
arch=('any')
url='https://github.com/mg979/vim-visual-multi'
license=('MIT')
depends=('vim')
conflicts=('vim-visual-multi-git')
source=("https://github.com/mg979/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6fe2345306c751ab9f84ff5f99ba77a79d0db391d38992904b40f0abc538dbc7')

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"

	cd "$srcdir/$pkgname-$pkgver"
	install -dv "$vimfiles"
	cp -R autoload doc plugin "$vimfiles/"
}

