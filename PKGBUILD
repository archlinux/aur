# Maintainer: Daniel Micay <danielmicay@gmail.com>
pkgname=vim-iptables
pkgver=1.09
pkgrel=1
_scriptid=21999
pkgdesc="iptables-save/restore syntax highlighter"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1425"
license=('custom')
groups=('vim-plugins')
depends=('vim')
source=(iptables.tar.bz2::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid
        ftdetect.vim)
md5sums=('deeeb182206177786f40bf60a78c8d43'
         '7e9ef051f5a11e3382d0a1c378d0df00')

package() {
  cd "$srcdir"
  install -Dm644 syntax/iptables.vim "$pkgdir/usr/share/vim/vimfiles/syntax/iptables.vim"
  install -Dm644 ftdetect.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/iptables.vim"
}
