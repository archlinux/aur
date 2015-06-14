# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 18/04/2011
# vim:set ts=2 sw=2 et ft=sh tw=100:
pkgname=vim-syslog
pkgver=1.1
pkgrel=2
_scriptid=1215
pkgdesc='Adds syntax color to log files created by sysklogd'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=419'
license=('custom:vim')
depends=('vim-runtime')
groups=('vim-syntax')
install=
noextract=()
source=("${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
  ftdetect.vim)

build(){
  cd "$srcdir"

	_vim_dir="usr/share/vim/vimfiles"
  install -Dm644 ${pkgname}.vim ${pkgdir}/${_vim_dir}/syntax/syslog.vim || return 1
  install -Dm644 ftdetect.vim ${pkgdir}/${_vim_dir}/ftdetect/syslog.vim || return 1
}

md5sums=('660833d71e7fb34555b2c71ea8bca25e'
         'e116363b944f08333cec2b04475f2766')
