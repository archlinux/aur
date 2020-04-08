# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=android-simg2img
pkgver=1.1.4
pkgrel=2
pkgdesc="standalone simg-tools"
arch=("x86_64")
url="https://github.com/anestisb/android-simg2img"
license=("Apache")
depends=("zlib")
conflicts=("simg-tools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/anestisb/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('cbd32490c1e29d9025601b81089b5aec1707cb62020dfcecd8747af4fde6fecd')

# build() {
# 	cd "$pkgname-$pkgver"
#   make PREFIX="$pkgdir/usr" all
# }

package() {
	cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}


