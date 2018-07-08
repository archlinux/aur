# Maintainer: Willem Herremans <whpgf at scarlet.be>
pkgname=tkpacman
pkgver=1.9.0
pkgrel=1
pkgdesc="A lightweight GUI for pacman built with Tcl/Tk"
arch=('any')
url="http://sourceforge.net/projects/tkpacman"
license=('GPL')
depends=('tcl>=8.6.0' 'tk>=8.6.0')
optdepends=('sudo: if you want to use sudo instead of su'
            'kdesu: if you want to use kdesu instead of su or sudo'
            'xterm: alternative terminal emulator'
            'vte3: alternative terminal emulator'
            'xfce4-terminal: alternative terminal emulator'
            'mate-terminal: alternative terminal emulator'
            'konsole: alternative terminal emulator'
            'qterminal: alternative terminal emulator')
source=(http://downloads.sourceforge.net/tkpacman/tkpacman-$pkgver/tkpacman-$pkgver.tar.gz)
#source=(tkpacman-$pkgver.tar.gz)
md5sums=('51d4b1b7bc0b0d419d2c0e1498edd604')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX='/usr' install
}
