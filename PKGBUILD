# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zbctl
pkgver=0.17.0
pkgrel=1
pkgdesc="CLI to interact with Zeebe"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe/tree/master/clients/zbctl"
license=('Apache')
depends=()
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/zeebe-io/zeebe/releases/download/$pkgver/zeebe-distribution-$pkgver.tar.gz")
md5sums=('b2d1c8d147f40e3572855cb146e76c99')

package() {
	install -Dm755 $srcdir/zeebe-broker-$pkgver/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
