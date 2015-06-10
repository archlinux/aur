# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: TheBenj <thebenj88 *AT* gmail *DOT* com>

pkgname=stardork
pkgver=0.7
pkgrel=1
pkgdesc="An ncurses-based space shooter"
arch=('i686' 'x86_64')
url="http://stardork.sourceforge.net/"
license=('GPL')
depends=('ncurses')
source=(http://downloads.sourceforge.net/project/stardork/$pkgname-$pkgver.tar.gz)
md5sums=('d830ec5b26c5a02abcae5811fae28e41')

build() {
    cd $srcdir/$pkgname-$pkgver
    make || return 1
    install -Dm 755 stardork $pkgdir/usr/bin/stardork
}
