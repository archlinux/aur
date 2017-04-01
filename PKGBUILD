# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm
pkgver=1.2.1
pkgrel=2
pkgdesc='Console display manager based on CDM'
arch=('any')
url='https://github.com/dopsi/console-tdm'
license=('GPL3')
provides=('console-tdm')
conflicts=('console-tdm')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/dopsi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('69116af4fae5335b0d534382968238205a833419364390bc3b94979bdb91b8fa')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:ts=4:sw=4:expandtab

