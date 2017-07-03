# Maintainer: JannikHv <JannikHv@gmail.com>
pkgname=connect-four-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc="A basic Connect Four game written in C using Gtk+3.0"
arch=('i686' 'x86_64')
url="https://github.com/JannikHv/connect-four-gtk"
license=('GPL2')
depends=('gtk3')
makedepends=('git')
source=("$pkgname"::"git://github.com/JannikHv/connect-four-gtk.git")
md5sums=('SKIP')

package() {
        cd $srcdir/$pkgname
        make
        /bin/install -Dm 0755 connect-four-gtk $pkgdir/usr/bin/connect-four-gtk
        /bin/install -Dm 0644 connect-four-gtk.desktop $pkgdir/usr/share/applications/connect-four-gtk.desktop
        /bin/install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
