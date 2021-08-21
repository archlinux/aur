# Maintainer: Ckat <ckat@teknik.io>

pkgname=ybacklight
pkgver=ac30673
pkgrel=1
pkgdesc='an xbacklight compatible replacement using sysfs'
arch=('any')
license=('GPL2')
depends=('perl')
conflicts=('ybacklight')
provides=('ybacklight')
url='https://github.com/yath/ybacklight'
source=("$pkgname::https://raw.githubusercontent.com/yath/ybacklight/ac3067350618bd9f95bb8fac678e6bdfff74a7e0/ybacklight"
	"90-ybacklight.rules")
md5sums=('2ed37a04024ee93694d75aea5edccd10'
         '82bc12b4e112ad12e12ca0a8dfbd3d36')

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 90-ybacklight.rules "$pkgdir/usr/lib/udev/rules.d/90-ybacklight.rules"
}
