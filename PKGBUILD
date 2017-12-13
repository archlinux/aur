# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm
pkgver=1.3.0
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
sha256sums=('7151ea6558bc88ed623ad5c45dcf466b0b69dbb928814a9f949a334af8992d06')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:ts=4:sw=4:expandtab

