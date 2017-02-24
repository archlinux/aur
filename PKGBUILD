# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm
pkgver=1.1.2
pkgrel=1
pkgdesc='Console display manager based on CDM'
arch=('any')
url='http://github.com/dopsi/console-tdm'
license=('GPL3')
provides=('console-tdm')
conflicts=('console-tdm')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/dopsi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ba795beb9a34cf4f3eff248c800012e1caae2baf3aaf919665c2d3ed54ff4d5f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="$pkgdir/usr" install
}

# vim:ts=4:sw=4:expandtab
