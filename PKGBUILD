# Maintainer: Dwayne Bent <dbb@dbb.io>
pkgname=vim-ferm
pkgver=0.04
pkgrel=2
pkgdesc='Vim syntax highlighting for ferm scripts'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4390'
license=('unknown')
depends=('vim-runtime')
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=19344")
md5sums=('3d10bdaaf94665485b6d1fe9f19df3eb')

package() {
	cd "${srcdir}/ferm.vim-master"

    install -D -m644 ftdetect/ferm.vim "${pkgdir}/usr/share/vim/vimfiles/ftdetect/ferm.vim"
    install -D -m644 syntax/ferm.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/ferm.vim"
}

