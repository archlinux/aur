# Maintainer : Ankit R Gadiya <arch@argp.in>
# Contributor: Daniel YC Lin <dlin <at> gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-voom
pkgver=5.3
_scriptid=25011
pkgrel=1
pkgdesc="VOoM - Vim two-pane outliner. Support mediawiki,rest,markdown,..."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2657"
license=('CCPL')
depends=('vim' 'python2')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
sha1sums=('52eab705d1f5640753213496befcab310633c844')

package() {
	install -dm755 "${pkgdir}"/usr/share/vim/vimfiles
	cp -a VOoM-"${pkgver}"/* "${pkgdir}"/usr/share/vim/vimfiles
}
