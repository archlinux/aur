# Maintainer: amtoaer <amtoaer@outlook.com>
pkgname=ipgw-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Northeastern University Gateway Client"
arch=('x86_64')
url="https://github.com/neucn/ipgw"
license=('MIT')

source=("https://github.com/neucn/ipgw/releases/download/v$pkgver/ipgw_linux")

md5sums=('beb7191bfbfc60de70a411461c64f473')

package(){
	install -D -m 755 $srcdir/ipgw_linux $pkgdir/usr/bin/ipgw
}
