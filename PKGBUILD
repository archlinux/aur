# Maintainer: Fionn Langhans <fionn.langhans@gmail.com>
pkgname=vim-syntax-highlighting-feder
pkgver=1.1
pkgrel=2
pkgdesc="Highlighting Feder syntax in vim"
arch=('any')
url="https://github.com/codefionn/feder-highlight"
license=('UNLICENSE')
groups=()
depends=('vim-runtime')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/codefionn/feder-highlight/releases/download/$pkgver/feder-highlight-$pkgver.zip")
noextract=()
md5sums=('6a9b1f6cec2ee457d11e032d97d3ebaa')

build() {
    cd "feder-highlight"

}

package() {
    mkdir --parents $pkgdir/usr/share/vim/vim80/ftdetect
    mkdir --parents $pkgdir/usr/share/vim/vim80/syntax
    mkdir --parents $pkgdir/usr/share/licenses/common/

    cp "$srcdir/feder-highlight/UNLICENSE" $pkgdir/usr/share/licenses/common
    cp "$srcdir/feder-highlight/feder_syntax.vim" $pkgdir/usr/share/vim/vim80/syntax/feder.vim
    cp "$srcdir/feder-highlight/feder_ftdetect.vim" $pkgdir/usr/share/vim/vim80/ftdetect/feder.vim
}
