# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-vbookmark
_pkgname=vbookmark
pkgver=0.3.0
_scriptid=18943
pkgrel=1
pkgdesc='A bookmark plugin'
arch=('any')
url='http://vim.org/scripts/script.php?script_id=4299>'
license=('BSD')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='vim-vbookmark.install'
source=(
"$pkgname-$pkgver.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
LICENSE
)

build() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles'

  install -Dm644 $pkgname-$pkgver.vim "$pkgdir"/${_vim_dir}/plugin/$_pkgname.vim
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('ddcd373a1557e21275ca1225215de751'
         '5c37619c721935e35467e511c61e59d6')
