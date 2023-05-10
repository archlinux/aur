# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=vim-xterm-color-table
pkgver=1.6
pkgrel=1
pkgdesc="All 256 xterm colors with their RGB equivalents, right in Vim!"
arch=("any")
url="https://www.vim.org/scripts/script.php?script_id=3412"
license=("MIT")
source=("https://www.vim.org/scripts/download_script.php?src_id=15556")
sha256sums=("abd6245fdf35a9156db8e02f3053f5cdf85c06806a08d4362821b7c94b1ec147")

package() {
  install -Dm 644 "$srcdir/xterm-color-table.vim/plugin/xterm-color-table.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/xterm-color-table.vim"
  install -Dm 644 "$srcdir/xterm-color-table.vim/doc/xterm-color-table.txt" "$pkgdir/usr/share/vim/vimfiles/doc/xterm-color-table.txt"
  install -Dm 644 "$srcdir/xterm-color-table.vim/README.markdown" "$pkgdir/usr/share/doc/$pkgname/README.markdown"
}
