# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# contributor: portix <portix@gmx.net>

pkgname=vim-colortest 
pkgver=0.1
_scriptid=4568
pkgrel=1
pkgdesc="xterm 256 color test and visual colors list"
arch=("i686" "x86_64")
url="http://www.vim.org/scripts/script.php?script_id=1349"
depends=('perl')
license=('WTFPL')
source=(colortest::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('3fb0cacc39d4bbed8c06689740a8f62d')

package() {
  install -D -m755 "${srcdir}/colortest" "${pkgdir}/usr/bin/colortest"
}
