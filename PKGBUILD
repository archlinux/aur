# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Michael Pusterhofer <pusterhofer@student.tugraz.at>

pkgname=vim-molokai
pkgver=1.1
pkgrel=7
pkgdesc='Port of the monokai colorscheme for TextMate'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=2340'
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname.vim::http://www.vim.org/scripts/download_script.php?src_id=9750"
        'https://raw.githubusercontent.com/tomasr/molokai/master/LICENSE.md')
md5sums=('fea8138fa815caa399f8b4fcf56bfe0e'
         '338d7dd470454d1998138ca71340ce16')

package() {
  install -Dm644 "$pkgname.vim" \
		"$pkgdir/usr/share/vim/vimfiles/colors/molokai.vim"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# getver: -u 2
# vim:set ts=2 sw=2 et:
