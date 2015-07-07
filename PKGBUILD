# Maintainer: Dmitry Popov <ixaphire@gmail.com>

pkgname=vim-xoria256
pkgver=1.5
pkgrel=1
pkgdesc='Soft pastel gamma on dark background, same appearence in {,g}vim'
arch=(any)
url='http://www.vim.org/scripts/script.php?script_id=2140'
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=15762)

package() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/colors/xoria256.vim
}

sha256sums=('34f921a9eb6698ce3042111dd41d6b8d9dd5cfe8dd41e50212b3d9be6cf5a401')
