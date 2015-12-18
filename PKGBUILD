# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Maintainer: CRT <cirkit@archlinux.email>
pkgname=vim-tetris
pkgver=0.52fix
_scriptid=172
pkgrel=1
pkgdesc="A tetris game in pure vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=172"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)

md5sums=('b96b4f021cc3594ae44551580e9483a6' 
	 'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}"/usr/share/vim/plugin/tetris.vim 
    install -Dm755 "${srcdir}"/license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
