# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm
pkgver=1.2.2
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
sha256sums=('a67939d25f33a6e30bac93375e52a07a5ea5432046f2139da2574b16323d96fb')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:ts=4:sw=4:expandtab

