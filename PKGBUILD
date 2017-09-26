# Maintainer:  TC <crt@archlinux.email>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-tetris
pkgver=0.53
_scriptid=24952
pkgrel=1
pkgdesc="A tetris game in pure vim"
arch=(i686 x86_64)
url="https://vim.sourceforge.io/scripts/script.php?script_id=172"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://vim.sourceforge.io/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('73f45c9e9e8f7ffc887e6e45f335c9fb'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -Dm644 "${srcdir}/${pkgname}" "${pkgdir}"/usr/share/vim/vim80/plugin/tetris.vim
    install -Dm644 "${srcdir}"/license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
