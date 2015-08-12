# Maintainer: lolilolicon <lolilolicon_at_gmail_dot_com>

_name=gundo
pkgname=vim-gundo
pkgver=2.5.0
pkgrel=2
_scriptid=20505
pkgdesc="Vim plugin to visualize your Vim undo tree"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=3304"
license=('GPL2')
depends=('vim>=7.3')
groups=('vim-plugins')
install=vimdoc.install
source=($_name-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('540561a9d08ca3a4aef837253c0187f0')

package() {
  cd "$srcdir"/$_name
  local _vimdir=$pkgdir/usr/share/vim/vimfiles
  install -D -m644 {,"$_vimdir"/}autoload/$_name.py
  install -D -m644 {,"$_vimdir"/}autoload/$_name.vim
  install -D -m644 {,"$_vimdir"/}doc/$_name.txt
  install -D -m644 {,"$_vimdir"/}plugin/$_name.vim
}
