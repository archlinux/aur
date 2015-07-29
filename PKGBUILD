# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=vimball
pkgver=33
_scriptid=1502
_srcid=15362
pkgrel=1
pkgdesc='Facilitates creating, extracting, and listing the contents of "vimball" archives (*.vba)'
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=${_scriptid}"
license=('Vim')
depends=('vim')
source=("vimball.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_srcid}")
sha512sums=('3a00ca26a911cdac1f0128b1128ac555ba751df9b6efc8076b5f573072e57dd67cd7d748e8b6f8e04b73248d973487d53ade403843ba9a443fb1df18e07287b9')

package() {
	cd "${srcdir}"
	install -Dm644 'plugin/vimballPlugin.vim' "${pkgdir}/usr/share/vim/vimfiles/plugin/vimballPlugin.vim"
	install -Dm644 'autoload/vimball.vim' "${pkgdir}/usr/share/vim/vimfiles/autoload/vimball.vim"
	install -Dm644 'doc/pi_vimball.txt' "${pkgdir}/usr/share/vim/vimfiles/doc/pi_vimball.txt"
}
