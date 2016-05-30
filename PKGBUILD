# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Laszlo Papp <djszapi2 at gmail com>

pkgname=vim-railscasts
pkgver=2.1
_scriptid=8379
pkgrel=1
pkgdesc="railscasts color theme that works in 256color terminals as well as gui"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2175"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install="${pkgname}.install"
source=("railscasts.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
        "LICENSE")
md5sums=('262b9a7bd797b0c7cef344262e6a33ab'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -Dm755 "${srcdir}/railscasts.vim"  "${pkgdir}/usr/share/vim/colors/railscasts.vim" || return 1
    install -Dm755 "${srcdir}/LICENSE"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
