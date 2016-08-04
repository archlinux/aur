# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm
pkgver=1.1.1
pkgrel=1
pkgdesc='Console display manager based on CDM'
arch=('any')
url='http://github.com/dopsi/console-tdm'
license=('GPL3')
provides=('console-tdm')
conflicts=('console-tdm')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=("https://github.com/dopsi/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('ab74c7b0245032fad7925e02d2a9c0eb36a0fb7b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="$pkgdir/usr" install
}

# vim:ts=4:sw=4:expandtab
