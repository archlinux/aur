# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=vim-eclipse
pkgver=1.0.2
_scriptid=6890
pkgrel=3
pkgdesc="while typing a C function, a prototype is shown (man3 based)"
arch=("i686" "x86_64")
url="http://www.vim.org/scripts/script.php?script_id=1802"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(eclipse.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e132f1c1487c7bfc2b239ce9d3669b8f'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -Dm755 "${srcdir}"/eclipse.vim "${pkgdir}"/usr/share/vim/colors/eclipse.vim
    install -Dm644 "${srcdir}"/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
