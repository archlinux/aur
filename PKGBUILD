# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
pkgname=turtle
pkgver=1.2.7
pkgrel=1
pkgdesc="A C++ Mock_object library based on Boost with a focus on usability, simplicity and flexibility."
arch=('i686' 'x86_64')
url="http://turtle.sourceforge.net"
license=('Boost')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('06067133ddcc33ec58df1f43843d96936d747b2011f0013b395ff23009da88a3')

package() {
    install -dm755 $pkgdir/usr/include/turtle
    install -dm755 $pkgdir/usr/include/turtle/detail
    install -m644 $srcdir/include/turtle/*.hpp $pkgdir/usr/include/turtle
    install -m644 $srcdir/include/turtle/detail/* $pkgdir/usr/include/turtle/detail
}
