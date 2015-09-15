# Maintainer: Janne Heß <jannehess at gmail dot com>
# Maintainer: Hendrik Luup <hendrik at luup dot info>
pkgname=dvorakng
pkgver=0.6.0rc1
pkgrel=3
pkgdesc="A Dvorak typing tutor. It's heavily based on Dvorak7min, but adds many improvements."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/dvorakng/"
license=('GPL')
source=(http://www.free.of.pl/n/nopik/$pkgname-$pkgver.tar.bz2)
md5sums=('677b38d63103d405b47751ead03c5e63')

build() {
    cd $srcdir/$pkgname
    make || return 1
}

package() {
    install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
