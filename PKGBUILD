# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-railscasts
pkgver=1.1
_scriptid=8379
pkgrel=2
pkgdesc="railscasts color theme that works in 256color terminals as well as gui"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2175"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('262b9a7bd797b0c7cef344262e6a33ab'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/railscasts.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
