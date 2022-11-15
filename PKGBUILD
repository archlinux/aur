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
source=("$pkgname.vim::https://www.vim.org/scripts/download_script.php?src_id=9750"
        'https://raw.githubusercontent.com/tomasr/molokai/master/LICENSE.md')
sha256sums=('1a1f3d14ed6d73836948d610fb2644bbf06f3cf2a6e7afe079bb957ef5a3f617'
            '263e96052648ab398088d855a62bf28c1dc1b13de88ea6138bb0c8c1adab6dee')

package() {
  install -Dm644 "$pkgname.vim" \
		"$pkgdir/usr/share/vim/vimfiles/colors/molokai.vim"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# getver: -u 2
# vim:set ts=2 sw=2 et:
