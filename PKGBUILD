# vim-visual-multi

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-visual-multi
pkgver=0.5.7
pkgrel=1
pkgdesc='Multiple cursors plugin for vim/neovim'
arch=('any')
url='https://github.com/mg979/vim-visual-multi'
license=('MIT')
depends=('vim')
conflicts=('vim-visual-multi-git')
source=("https://github.com/mg979/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('48e978ef127604ef437b04ae5afc2cbe9831ef568900ec2e584746154a6f8602')

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"

	cd "$srcdir/$pkgname-$pkgver"
	install -dv "$vimfiles"
	cp -R autoload doc plugin "$vimfiles/"
}

