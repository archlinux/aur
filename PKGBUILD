# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm
pkgver=1.2.0
pkgrel=2
pkgdesc='Console display manager based on CDM'
arch=('any')
url='http://github.com/dopsi/console-tdm'
license=('GPL3')
provides=('console-tdm')
conflicts=('console-tdm')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/dopsi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('522376086dbb4fcfb94bfe6f7f9add42b07c3a34ce534b332a044702e7a34f4d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:ts=4:sw=4:expandtab

