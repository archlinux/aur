# Maintainer: Dmitry Popov <ixaphire@gmail.com>

pkgname=vim-xoria256
pkgver=1.8
pkgrel=1
pkgdesc='Soft pastel gamma on dark background, same appearence in {,g}vim'
arch=(any)
url='http://www.vim.org/scripts/script.php?script_id=2140'
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=26882)

package() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/colors/xoria256.vim
}

sha256sums=('e4d20e5e4fdc6fe26838dead046b5e85bcbdf5efa17adfe7ec76664e8efb1659')
