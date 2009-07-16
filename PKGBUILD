# Maintainer: Aaron Schaefer <aaron@elasticdog.com>
pkgname=vim-pastie
pkgver=2.0
_scriptid=10260
pkgrel=1
pkgdesc='A Vim plugin that lets you read and create pastes at http://pastie.org/'
arch=('i686' 'x86_64')
url='http://www.vim.org/scripts/script.php?script_id=1624'
license=('custom:vim')
depends=('ruby' 'vim')
source=("http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('4ba364a003903ace6fd51ccbe6b86d78')

build() {
  cd "$srcdir"
  mv "download_script.php?src_id=$_scriptid" "pastie-$pkgver.vim"

  install -D -m644 "pastie-$pkgver.vim" "$pkgdir/usr/share/vim/plugin/pastie.vim"
}
