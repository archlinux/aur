# Maintainer: Ckat <ckat@teknik.io>

pkgname=ybacklight
pkgver=55d2d70
pkgrel=1
pkgdesc='an xbacklight compatible replacement using sysfs'
arch=('any')
license=('GPL2')
depends=('perl' 'perl-file-util')
conflicts=('ybacklight')
provides=('ybacklight')
url='https://github.com/yath/ybacklight'
source=("$pkgname::https://raw.githubusercontent.com/yath/ybacklight/55d2d703d30291b5b5276f10aa1fcacb5bfe3d33/ybacklight")
md5sums=('ade6c20e33db2c3daeca4bd57c749df5')

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
