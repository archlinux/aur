# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vim-vbookmark
_pkgname=vbookmark
pkgver=0.3.0
_scriptid=18943
pkgrel=2
pkgdesc='A bookmark plugin'
arch=('any')
url='http://vim.org/scripts/script.php?script_id=4299'
license=('BSD')
groups=('vim-plugins')
depends=('vim-runtime')
install='vim-vbookmark.install'
source=($pkgname-$pkgver.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
sha256sums=('8b952e710424ce87f77b1862e088761aba7b175cf47254b5852b9a606a3832dc')
package() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles'

  install -Dm644 $pkgname-$pkgver.vim "$pkgdir"/${_vim_dir}/plugin/$_pkgname.vim
}
