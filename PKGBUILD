# Maintainer: revel <revelΘmuub·net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-colorsupport
pkgver=1.0.5
_scriptid=20938
pkgrel=2
pkgdesc='Use colorschemes written for gvim in color terminals'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2682'
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=('colorsupport.vim'::"http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
md5sums=('89070803208f3c156888ce6e2e3003dc')
sha256sums=('a1f7db6f9ff21f2924ca025ecf195d3f09e24343572cbcea0300fba5dcd3c3a1')

package() {
    install -Dm644 "colorsupport.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/colorsupport.vim"
}
