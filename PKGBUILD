# Maintainer: Willem Herremans <whpgf at scarlet.be>
pkgname=tkpacman
pkgver=1.8.0
pkgrel=2
pkgdesc="A lightweight GUI for pacman built with Tcl/Tk"
arch=('any')
url="http://sourceforge.net/projects/tkpacman"
license=('GPL')
depends=('tcl>=8.6.0' 'tk>=8.6.0')
optdepends=('sudo: if you want to use sudo instead of su'
            'gksu: if you want to use gksu instead of su or sudo'
            'kdesu: if you want to use kdesu instead of su or sudo'
            'xterm: alternative terminal emulator'
            'vte: alternative terminal emulator'
            'xfce4-terminal: alternative terminal emulator'
            'mate-terminal: alternative terminal emulator'
            'konsole: alternative terminal emulator'
            'qterminal: alternative terminal emulator')
source=(tkpacman-$pkgver.tar.gz)
md5sums=('3878bcd73696e756227fb2bfcbf2c365')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX='/usr' install
}
