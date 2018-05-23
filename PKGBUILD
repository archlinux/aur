# Maintainer: vimacs <https://vimacs.lcpu.club>

pkgname=vim-myr-git
pkgver=4
pkgrel=1
pkgdesc='Myrddin configuration for Vim'
url='https://myrlang.org/'
arch=('any')
depends=('vim')
license=('MIT')
source=('git+git://git.eigenstate.org/ori/vim-myr.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/vim-myr"
	git log --oneline | wc -l
}

build() {
	true
}

package() {
	cd "$srcdir/vim-myr"
	install -d "$pkgdir/usr/share/vim/vimfiles/"
	cp -r */ "$pkgdir/usr/share/vim/vimfiles/"
}
