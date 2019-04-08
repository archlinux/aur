# Maintainer: olddog <jeff@impcode.com>
# Contributer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vim-toggle
pkgver=0.6
_scriptid=26272
pkgrel=3
pkgdesc='Toggles between values: on/off, true/false, yes/no, define/undef, +/-, >/<, &&/||, &/| and positive and negative numbers by pressing <C-T> or +'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=895'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-runtime')
source=("${pkgname}-${pkgver}.vim::https://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
md5sums=('8f556a85aa46b1b1fc2b6bd2dee5da70')

package() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles'
  install -Dm644 ${pkgname}-${pkgver}.vim ${pkgdir}/${_vim_dir}/${pkgname}.vim || return 1
}
