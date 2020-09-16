# Maintainer: amtoaer <amtoaer@outlook.com>
pkgname=ipgw-bin
pkgver=1.3.0
pkgrel=2
pkgdesc="Northeastern University Gateway Client"
arch=('x86_64')
url="https://github.com/neucn/ipgw"
license=('MIT')

source=(
	"ipgw_linux::https://github.com/neucn/ipgw/releases/download/v$pkgver/ipgw_linux"
	"LICENSE::https://raw.githubusercontent.com/neucn/ipgw/old-v1/LICENSE"
)

md5sums=(
	'beb7191bfbfc60de70a411461c64f473'
	'fdd05dfe38c1cd8695958d07c347dbfc'	
)

package(){
	install -D -m 755 $srcdir/ipgw_linux $pkgdir/usr/bin/ipgw
	install -D -m 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
