# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail dot com>

pkgname=vim-jquery
pkgver=0.5.2
pkgrel=2
_scriptid=15752
pkgdesc="Syntax file for jQuery"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2416"
license=('unknown')
depends=('vim')
groups=('vim-plugins')
install=vim-jquery.install
source=(jquery.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('61056989ccd7cd0aa207a24681c52fa5')

package() {
	cd "${srcdir}"
	local _installpath="${pkgdir}/usr/share/vim/vimfiles"
	install -Dm644 jquery.vim "${_installpath}"/syntax/jquery.vim
}
