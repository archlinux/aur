# Maintainer: Gonzalo Ciruelos <gonzalo.ciruelos@gmail.com> 

pkgname=termplot
binname=termplot
pkgver=0.2
pkgrel=1
install=.INSTALL
pkgdesc="Terminal-based mathematical function plotter"
arch=('i686' 'x86_64')
depends=('ncurses')
url="https://github.com/gciruelos/termplot"
makedepends=('git' 'gcc')
source=('termplot::git+https://github.com/gciruelos/termplot.git')
md5sums=('SKIP')


build() {
    cd $pkgname
    make ncurses
}

package() {
    cd $pkgname
    install -Dm755 $binname "$pkgdir/usr/bin/$binname"
}

