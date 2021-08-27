# Maintainer: Ckat <ckat@teknik.io>

_commithash='53bf1f7173cf3fd741d50bd5a76244e3c0175cf2'
pkgname=ybacklight
pkgver=r9.53bf1f7
pkgrel=1
pkgdesc='an xbacklight compatable replacement using sysfs'
arch=('any')
license=('GPL2')
depends=('perl')
conflicts=('ybacklight')
provides=('ybacklight')
url='https://github.com/yath/ybacklight'
source=("$pkgname::https://raw.githubusercontent.com/yath/ybacklight/$_commithash/ybacklight"
	"90-ybacklight.rules::https://raw.githubusercontent.com/yath/ybacklight/$_commithash/90-ybacklight.rules")
md5sums=('2ed37a04024ee93694d75aea5edccd10'
         '82bc12b4e112ad12e12ca0a8dfbd3d36')

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 90-ybacklight.rules "$pkgdir/usr/lib/udev/rules.d/90-ybacklight.rules"
}
