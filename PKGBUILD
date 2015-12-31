# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm
pkgver=1.0.0
pkgrel=1
pkgdesc='Console display manager based on CDM'
arch=('any')
url='http://github.com/dopsi/console-tdm'
license=('GPL')
provides=('console-tdm')
conflicts=('console-tdm')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=('https://github.com/dopsi/console-tdm/archive/v1.0.0.tar.gz')
sha1sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="$pkgdir/usr" install
}

# vim:ts=4:sw=4:expandtab
