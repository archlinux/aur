# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm
pkgver=1.3.1
pkgrel=1
pkgdesc='Console display manager based on CDM'
arch=('any')
url='https://github.com/dopsi/console-tdm'
license=('GPL3')
provides=('console-tdm')
conflicts=('console-tdm')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/dopsi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('97f2b7c6b06d29718186251a76fec048583a431f3d88742f9f575926cef7a49b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:ts=4:sw=4:expandtab

