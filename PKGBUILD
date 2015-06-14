# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-toggle
pkgver=0.5
_scriptid=13834
pkgrel=1
pkgdesc='Toggles between values: on/off, true/false, yes/no, define/undef, +/-, >/<, &&/||, &/| and positive and negative numbers by pressing <C-T> or +'
arch=('any')
url='http://vim.org/scripts/script.php?script_id=895'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install='vimdoc.install'
source=("${pkgname}-${pkgver}.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")

build() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles/plugin'
  install -Dm644 $pkgname-$pkgver.vim ${pkgdir}/${_vim_dir}/$pkgname.vim || return 1
}
md5sums=('384333222fa486bf82707621fd77f87c')
