# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-cabal
pkgver=1.4
_scriptid=16755
pkgrel=2
pkgdesc="Syntax coloration for Cabal"
arch=('i686' 'x86_64')
url="https://www.vim.org/scripts/script.php?script_id=2625"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(cabal.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('6e93a324d4d57e0e56aac949f93d0c0c'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -Dm644 "$srcdir/cabal.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/cabal.vim"
    install -Dm755 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

