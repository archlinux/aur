# Maintainer: amtoaer <amtoaer@gmail.com>
pkgname=ipgw-bin
pkgver=0.1.2
pkgrel=1
# update from 1.3.0 to 0.1.1
epoch=1
pkgdesc="Northeastern University Gateway Client"
arch=('x86_64')
url="https://github.com/neucn/ipgw"
license=('MIT')

source=(
	"ipgw_linux::https://github.com/neucn/ipgw/releases/download/v$pkgver/ipgw-linux-amd64.zip"
	"LICENSE::https://raw.githubusercontent.com/neucn/ipgw/master/LICENSE"
)

md5sums=(
	'dd3b216d5ef567b9220ad0619e57dd52'
	'82fc1432415e7f3a2581dff2acb762e5'
)

package() {
	install -D -m 755 $srcdir/ipgw $pkgdir/usr/bin/ipgw
	install -D -m 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
