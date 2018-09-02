# Maintainer: Ferdi265 <theferdi265 at gmail dot com>
pkgname=nmap-netcat
pkgver=1.0
pkgrel=1
pkgdesc="Use nmaps ncat as netcat"
dependencies=(nmap)
arch=('i686' 'x86_64')
license=('GPL')
source=()
md5sums=()

build() {
    true
}

package() {
    mkdir -p $pkgdir/usr/bin
    ln -sf /usr/bin/ncat $pkgdir/usr/bin/netcat
    ln -sf /usr/bin/netcat $pkgdir/usr/bin/nc
}
