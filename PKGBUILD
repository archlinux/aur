pkgname="inet-comm"
epoch=3
pkgver=6
pkgrel=0
pkgdesc="ipv4 internet tcp socket c++ library"
arch=("x86_64")
url="https://github.com/imperzer0/inet-comm"
license=('GPL')
depends=("log-console>=1.17-1")
makedepends=()
source=("https://raw.githubusercontent.com/imperzer0/inet-comm/master/inet-comm")
md5sums=("9409725a5e1448b6aad6bca851a6aa23")
# install=inet-comm.install

package()
{
	install -Dm755 "./$pkgname" "$pkgdir/usr/include/$pkgname"
}

