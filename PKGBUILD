pkgname=vim-togglemouse
pkgver=1.0
pkgrel=2
pkgdesc="Toggles the mouse focus between Vim and your terminal emulator."
arch=(any)
url=http://www.vim.org/scripts/script.php?script_id=3166
license=('unknown')
depends=('vim')
groups=('vim-plugins')
source=(togglemouse.vim::http://www.vim.org/scripts/download_script.php?src_id=13406)
md5sums=('699bcb6f5d1442d40f8b441fcb16f28e')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/vim/vimfiles/plugin
  install -m644  $srcdir/togglemouse.vim $pkgdir/usr/share/vim/vimfiles/plugin/
}
