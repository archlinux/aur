# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=vim-systemverilog-git
pkgver=r12.ac744cf
pkgrel=1
pkgdesc='SystemVerilog support for vim'
arch=(any)
url='https://github.com/WeiChungWu/vim-SystemVerilog'
license=(unspecified)
makedepends=(git)
source=(git://github.com/WeiChungWu/vim-SystemVerilog)
sha1sums=('SKIP')

pkgver() {
  cd vim-SystemVerilog
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -r vim-SystemVerilog/{ftdetect,ftplugin,indent,snippets,syntax} "$pkgdir/usr/share/vim/vimfiles/"
#  install -Dm755 vim-SystemVerilog/{ftdetect,ftplugin,indent,snippets,syntax} "$pkgdir/usr/share/vim/vimfiles/"
}
