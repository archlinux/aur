# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

pkgname=vim-phpcomplete
pkgver=1.3.3
pkgrel=1
pkgdesc="Omni completition for PHP"
url="http://www.vim.org/scripts/script.php?script_id=3171"
arch=('i686' 'x86_64')
license=('custom')
depends=('vim')
optdepends=()
groups=('vim-plugins')
makedepends=()
conflicts=()
replaces=()
backup=()
install='vimdoc.install'

_scriptid=14129
source=(phpcomplete.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})


md5sums=('d6568ed0a154819ab897f17b71785d2a')


build() {
	
        install -Dm755 ${srcdir}/phpcomplete.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/phpcomplete.vim || return 1
}

