# Maintainer: yesuu zhang <yesuu79@qq.com>
# Contributor: cap_sensitive <cap.sensitive@gmail.com>

pkgname=vimim
pkgver=1.0.0.1
pkgrel=1
pkgdesc='The VimIM is a Vim plugin designed as an independent IM (Input Method) to support CJK search and CJK input, with or without vim omni popup window.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2506'
license=('GPL')
groups=('vim-plugins')
depends=('vim>=7.0')
source=('vimim.vim::http://www.vim.org/scripts/download_script.php?src_id=23122')
md5sums=('d76596281165b27194c965c2eb73a6e0')

package() {
	cd ${srcdir}
	install --directory "${pkgdir}/usr/share/vim/vimfiles/plugin"
	cp vimim.vim "${pkgdir}/usr/share/vim/vimfiles/plugin"
}
