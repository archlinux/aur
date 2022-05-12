# Maintainer: ElnuDev <elnu@elnu.com>
pkgname=rofi-checklist-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist checklist menu for rofi"
arch=(any)
url="https://github.com/ElnuDev/rofi-checklist"
license=('GPLv3')
depends=('rofi')
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')
package() {
	cd rofi-checklist || exit 1
	install -Dm755 "rofi-checklist.sh" "$pkgdir/usr/bin/rofi-checklist"
}
