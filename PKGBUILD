# Maintainer: Dominic Zimmer <s8dozimm@stud.uni-saarland.de> 
_pkgname=vim-pseuco
pkgname="${_pkgname}"
pkgver=0.1
pkgrel=1
pkgdesc="Vim syntax highlighting for Pseuco"
arch=("i686" "x86_64")
license=('GPL')
depends=("vim-runtime")
source=(syntax.vim ftdetect.vim)
sha256sums=('31871739da73a79f56df56f5570e0c17a8584c306bb409c0ee865d2066f53a19' 'eaf15b12b6dd29d16f9a28b67ee7a68bfccf4dc5ffce15f40a0d4b2c400963ec')

package() {
    _vimdir=$pkgdir/usr/share/vim/vimfiles
    cd $srcdir
    mkdir -p $pkgdir/usr/share/vim/vimfiles/syntax
    mkdir -p $pkgdir/usr/share/vim/vimfiles/ftdetect
    cp syntax.vim $_vimdir/syntax/pseuco.vim
    cp ftdetect.vim $_vimdir/ftdetect/pseuco.vim
}
