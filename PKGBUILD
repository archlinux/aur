# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm-git
pkgver=1.0
pkgrel=1
pkgdesc='Console display manager based on CDM'
arch=('any')
url='http://github.com/dopsi/console-tdm'
license=('GPL')
provides=('console-tdm')
conflicts=('console-tdm')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=('git://github.com/dopsi/console-tdm')
sha1sums=('SKIP')

_gitname=console-tdm

build() {
    echo "No build required"
}

package() {
    cd "$_gitname"
    make PREFIX="$pkgdir/usr" install
}

# vim:ts=4:sw=4:expandtab
