# Maintainer: Stefan Schmidt <thrimbor.github@gmail.com>

pkgname=pearpc-git
pkgver=0.6pre
pkgrel=2
arch=('i686' 'x86_64')
url="http://pearpc.sourceforge.net"
license=('GPL')
depends=('libx11')
source=(https://github.com/sebastianbiallas/pearpc/archive/master.zip)
md5sums=('SKIP')

build() {
    cd pearpc-master
    ./autogen.sh
    ./configure --prefix=/usr

    make
}

package() {
    cd pearpc-master
    make prefix=${pkgdir}/usr install
}
