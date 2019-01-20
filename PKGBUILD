# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=vim-systemd
pkgver=20170410
pkgrel=1
pkgdesc="ViM syntax highlighting for systemd unit files"
arch=("any")
url="http://fedorapeople.org/cgit/wwoods/public_git/vim-scripts.git/"
license=('unknown')
depends=('vim')
source=("git+https://fedorapeople.org/cgit/wwoods/public_git/vim-scripts.git")
md5sums=('SKIP')

package () {
  cd vim-scripts
  install -Dm0644 ftdetect/systemd.vim "$pkgdir"/usr/share/vim/vimfiles/ftdetect/systemd.vim
  install -Dm0644 ftdetect/udev.vim "$pkgdir"/usr/share/vim/vimfiles/ftdetect/udev.vim
  install -Dm0644 syntax/systemd.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/systemd.vim
  install -Dm0644 syntax/udev.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/udev.vim
}
