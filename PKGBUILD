# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: q9 <qqqqqqqqq9 at gmeyer dot df-kunde dot org>
# Contributor: OmeGa <omega at mailoo dot org>
# Contributor: vti <viacheslav.t at gmail dot com>
# Contributor: Danny Navarro <j@dannynavarro.net>

pkgname=vim-yankring
pkgver=20.0
pkgrel=1
pkgdesc='Maintains a history of previous yanks, changes and deletes'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=1234'
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=26344")
sha256sums=('8dfdd36d4c36a9a5fc56e6bdb919d9bb5394079b070fe3df1dfca2665d42b3ad')

package() {
  install -Dm644 plugin/yankring.vim \
    "$pkgdir/usr/share/vim/vimfiles/plugin/yankring.vim"
  install -Dm644 doc/yankring.txt \
    "$pkgdir/usr/share/vim/vimfiles/doc/yankring.txt"
}
