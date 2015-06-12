# Maintainer: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
pkgname=vim-r
pkgver=0.9.9.7
pkgrel=4
pkgdesc="This plugin improves Vim's support for editing R code"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2628"
license=('unknown')
depends=('vim' 'tmux')
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=20996")
noextract=("$_pkgname-$pkgver.zip")
md5sums=('4485189412a413856cf0bc01d2b53dc4')

package() {
    mkdir -p "$pkgdir"/usr/share/vim/vimfiles
    unzip -d "$pkgdir"/usr/share/vim/vimfiles "$srcdir"/$pkgname-$pkgver.zip

    msg "***************************************************************"
    msg "TODO:"
    msg "Intall the R package VimCom: https://github.com/jalvesaq/VimCom"
    msg "Add 'library(vimcom.plus)' to your ~/.Rprofile"
    msg "***************************************************************"
    msg ""
}
