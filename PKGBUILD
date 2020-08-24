# vim-markdown-toc

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-markdown-toc
pkgver=1.4.0
pkgrel=1
pkgdesc='A vim 7.4+ plugin to generate table of contents for Markdown files.'
arch=('any')
url='https://github.com/mzlogin/vim-markdown-toc'
license=('MIT')
depends=('vim')
conflicts=('vim-markdown-toc-git')
source=("https://github.com/mzlogin/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4353a1a067cd871f27e120e61617dbe4d37c5256b29c4d27af95d9d5f59ff154')

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"

	cd "$srcdir/$pkgname-$pkgver"
	install -dv "$vimfiles"
	cp -R ftdetect ftplugin "$vimfiles/"
}

