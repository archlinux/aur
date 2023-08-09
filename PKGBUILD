# Maintainer: EMPTY <testerthe60@gmail.com>
pkgname=portmaster-dinit
pkgver=1.0.0
pkgrel=1
pkgdesc="Dinit service file for portmaster"
arch=("any")
url="https://github.com/0x454d505459/portmaster-dinit"
license=('GPLv3')
groups=()
depends=('portmaster-stub-bin')
source=('portmaster' 'environment')
md5sums=('9993b6ccd8a93516aaee3aa36ac37289'
  '5abcac8f1419805dff60ac0f64d90056')

package() {
  install -D -d "$pkgdir/etc/dinit"
  install -D -d "$pkgdir/etc/dinit.d"
  cp -a portmaster "$pkgdir/etc/dinit.d/portmaster"
  cp -a environment "$pkgdir/etc/dinit/environment"
}
