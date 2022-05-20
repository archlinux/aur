# Maintainer: Sergey Shatunov <me@prok.pw>
pkgname=zram-generator-defaults
pkgver=2
pkgrel=1
pkgdesc="Fedora's defaults for zram-generator"
arch=("any")
url="https://github.com/systemd/zram-generator"
license=('MIT')
depends=("zram-generator")
source=("zram-generator.conf")
sah256sums=("")

package() {
	install -Dpm644 "$srcdir/zram-generator.conf" "$pkgdir/usr/lib/systemd/zram-generator.conf"
}

md5sums=('c1599a50d20be450811f1a97745739e7')
