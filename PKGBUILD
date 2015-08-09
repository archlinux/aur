# Maintainer: Darshit Shah <darnir@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=runningx
pkgver=20101203
pkgrel=1
pkgdesc="A simple C program which uses an X call to determine if X is running"

arch=('any')
url="http://www.fiction.net/blong/programs/mutt/"
license=('unknown')
depends=('libx11')
source=('http://www.fiction.net/blong/programs/mutt/autoview/RunningX.c')
md5sums=('31fa80ae98c0fefe11e4786b2d7e4e79')

package() {
    cd $srcdir || return 1
    gcc -o RunningX RunningX.c -lX11
    mkdir -p $pkgdir/usr/bin/
    cp RunningX $pkgdir/usr/bin/runningx
}
# vim:set ts=2 sw=2 et:
