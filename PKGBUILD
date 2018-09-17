# Maintainer: Ferdi265 <theferdi265 at gmail dot com>
pkgname=nmap-netcat
pkgver=1.0
pkgrel=3
pkgdesc="Use nmap's ncat as netcat"
dependencies=(nmap)
conflicts=(gnu-netcat openbsd-netcat)
provides=(netcat)
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
