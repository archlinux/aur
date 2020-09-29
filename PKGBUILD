# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Olivier Mehani <shtrom+aur@ssji.ne>

pkgname=vim-indent-guides
pkgver=1.7
pkgrel=1
pkgdesc='Visually display indent levels in Vim'
arch=(any)
url='http://www.vim.org/scripts/script.php?script_id=3361'
license=(MIT)
groups=('vim-plugins')
depends=(vim)
install=vimdoc.install
source=("indent-guides-${pkgver}.tar.gz::https://www.vim.org/scripts/download_script.php?src_id=19601")
sha256sums=('2995514b55f162ee0a238aec8b4bba0d33f3a187442977ad8f2f17d8f99efd62')

package() {
    cd "$srcdir/"
    local installpath="$pkgdir/usr/share/vim/vimfiles"
    mkdir -p "$installpath"
    cp -r autoload plugin doc "$installpath"
}
