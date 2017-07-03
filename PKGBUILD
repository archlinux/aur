# Maintainer: JannikHv <JannikHv@gmail.com>
pkgname=tictactoe-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc="A basic TicTacToe game written in C using Gtk+3.0"
arch=('i686' 'x86_64')
url="https://github.com/JannikHv/tictactoe-gtk"
license=('GPL2')
depends=('gtk3')
makedepends=('git')
source=("$pkgname"::"git://github.com/JannikHv/TicTacToe-Gtk.git")
md5sums=('SKIP')

package() {
        cd $srcdir/$pkgname
        make

        /bin/install -Dm 0755 tictactoe-gtk $pkgdir/usr/bin/tictactoe-gtk
        /bin/install -Dm 0644 tictactoe-gtk.desktop $pkgdir/usr/share/applications/tictactoe-gtk.desktop
        /bin/install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
