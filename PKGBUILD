# Maintainer: Bjorn Pagen <bjornpagenatgmailcom>

pkgname=vim-brainfuck
pkgver=1.0.3
_scriptid=22518
pkgrel=1
pkgdesc='Vim syntax highlighting for the brainfuck programming language'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=716'
license=('BSD')
depends=('vim-runtime')
source=("http://www.vim.org/scripts/download_script.php?src_id=$_scriptid" brainfuck.vim)
sha256sums=('70801ce78e0c8cc7731b573ce5018ed97e17c8121c1896ebd95986ff032d62bb'
	'352e03a934d0becdf400ef7c4b195c936c154b1851f6ed432bd0de0edf50ef7f')

package() {
  cd "$srcdir"
  local installpath="$pkgdir/usr/share/vim/vimfiles"

  install -D -m644 "download_script.php?src_id=$_scriptid" "$installpath/syntax/brainfuck.vim"
  install -D -m644 "brainfuck.vim" "$installpath/ftdetect/brainfuck.vim"
}
