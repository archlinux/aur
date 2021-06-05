# Contributor: Score_Under <seejay.11@gmail.com>

pkgname=jj
pkgver=2
pkgrel=1
pkgdesc="A simple FIFO and filesystem based Jabber/XMPP client"
url="https://23.fi/$pkgname/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=(loudmouth glib2)
source=("https://23.fi/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ea5d307194277415187e3210db744b53')

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 jj "$pkgdir/usr/bin/jj"
}
