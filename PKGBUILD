# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
# Contributor: Robson R S Peixoto <robsonpeixoto at gmail dot com>

pkgname=vim-pythonhelper
pkgver=0.83
pkgrel=5
_scriptid=12010
_scriptname=pythonhelper.vim
pkgdesc="Displays Python class, method or function the cursor is in on the status line"
arch=('any')
url="https://www.vim.org/scripts/script.php?script_id=435"
license=('unknown')
groups=('vim-plugins')
depends=('vim' 'python2')
install='vimdoc.install'
source=(${_scriptname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('84b9e7c94167eb859b6a729559294869')

package() {
  install -Dm644 ${srcdir}/${_scriptname} ${pkgdir}/usr/share/vim/vimfiles/ftplugin/python/${_scriptname}
}
