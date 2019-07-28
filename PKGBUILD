# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zbctl
pkgver=0.20.0
pkgrel=1
pkgdesc="CLI to interact with Zeebe"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe/tree/master/clients/zbctl"
license=('Apache')
depends=()
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/zeebe-io/zeebe/releases/download/$pkgver/zeebe-distribution-$pkgver.tar.gz")
md5sums=('8d758031eb7248dcf6915fd6cb0b14e4')

package() {
	install -Dm755 $srcdir/zeebe-broker-$pkgver/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
