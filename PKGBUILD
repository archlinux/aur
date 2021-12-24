# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=neovim-qml
url="https://github.com/peterhoeg/vim-qml"
_commit=50d2e737094c146195171b7d52e522384f15afe8
arch=('any')
license=('unknown')
makedepends=()
depends=('neovim')
groups=('neovim-plugins')
pkgver=r50.50d2e73
pkgrel=1
pkgdesc='QML syntax highlighting for Neovim'
source=("https://github.com/peterhoeg/vim-qml/archive/$_commit.zip")
sha256sums=('765005e90c3f3153a52e32e79665fbb85ecaa7452c8de2d4992e78820b317bbb')

package() {
    _installdir="$pkgdir/usr/share/nvim/runtime"
    cd "vim-qml-$_commit"

    for d in ftdetect ftplugin indent syntax
    do
        install -Dvm644 "$d/qml.vim" "$_installdir/$d/qml.vim"
    done
}
