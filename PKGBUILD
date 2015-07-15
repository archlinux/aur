# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=vim-opencl
pkgver=1
pkgrel=1
pkgdesc="Vim plugin for syntax checking and highliting for OpenCL files."
arch=('any')
url="https://github.com/petRUShka/vim-opencl"
license=('UNKNOWN')
groups=('vim-plugins')
source=("https://github.com/petRUShka/vim-opencl/archive/master.zip")
sha512sums=('SKIP')

optdepends=('vim-syntastic: enable syntax checker 1/2'
            'clcc: enable syntax checker 2/2')

package() {
	cd "$srcdir/$pkgname-master"
	install -m 644 -D "ftdetect/opencl.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/opencl.vim"
	install -m 644 -D "ftplugin/opencl.vim" "${pkgdir}/usr/share/vim/vimfiles/ftplugin/opencl.vim"
	install -m 644 -D "indent/opencl.vim" "${pkgdir}/usr/share/vim/vimfiles/indent/opencl.vim"
	install -m 644 -D "syntax/opencl.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/opencl.vim"
	install -m 644 -D "syntax_checkers/opencl.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax_checkers/opencl.vim"
}

# vim:set ts=2 sw=2 et:
