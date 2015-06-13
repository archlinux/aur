# Contributor: Daniel YC Lin <dlin.tw <at> gmail.com>
# Maintainer: Daniel YC Lin <dlin.tw <at> gmail.com>

pkgname=vim-dotoutlinetree
pkgver=1.2.3
_scriptid=1225
_srcid=16393
pkgrel=1
pkgdesc="DotOutlineTree - Helps you edit structured text"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=$_scriptid"
license=('unknown')
depends=("vim>=7.0")
groups=('vim-plugins')
install=vimdoc.install
source=(dot.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
md5sums=('8028a7571dd465e8f2f261dd649db4c5')

package() {
	cd ${srcdir}
	installpath="${pkgdir}/usr/share/vim/vimfiles"
	install -D -m644 dot.vim $installpath/plugin/dot.vim || return 1
}
