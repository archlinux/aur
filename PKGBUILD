# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>

pkgname=vim-molokai
pkgver=1.1
pkgrel=4
pkgdesc='Port of the monokai colorscheme for TextMate'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2340'
license=('custom')
depends=('vim')
source=('http://www.vim.org/scripts/download_script.php?src_id=9750')
md5sums=('fea8138fa815caa399f8b4fcf56bfe0e')

package() {
  install -Dm644 'download_script.php?src_id=9750' \
		"$pkgdir/usr/share/vim/vimfiles/colors/molokai.vim"
}

# getver: -u 2
# vim:set ts=2 sw=2 et:
