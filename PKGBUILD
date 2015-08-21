# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Olivier Mehani <shtrom+aur@ssji.ne>

pkgname=vim-indent-guides
pkgver=1.6
pkgrel=1
pkgdesc='Visually display indent levels in Vim'
arch=(any)
url='http://www.vim.org/scripts/script.php?script_id=3361'
license=(MIT)
groups=('vim-plugins')
depends=(vim)
install=vimdoc.install
source=("https://github.com/nathanaelkane/vim-indent-guides/archive/${pkgver}.tar.gz")
sha256sums=('11c401fb1b23e42536238011c28027e1e2807b210686d94f5f445638bbc075fe')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    local installpath="$pkgdir/usr/share/vim/vimfiles"
    mkdir -p "$installpath"
    cp -r autoload plugin doc "$installpath"
}
