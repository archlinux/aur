##
# Maintainer: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##

pkgname=vim-fluxkeys
pkgver=20091101
_scriptid=11641
pkgrel=5
pkgdesc="Fluxbox fluxkeys syntax highlighting"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=882"
license=('GPL')
depends=(
    'vim'
)
groups=(
    'vim-plugins'
)
source=(
    ${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
)
md5sums=(
    '150a587964d562e10b033fd38a822f9c'
)

package() {
    install -Dm644 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/syntax/fluxkeys.vim
}
