# Maintainer: Jonas Franz <email@jfdev.de>

pkgname=u2f-udev-rules-feitian
pkgver=20190417
pkgrel=1
pkgdesc="UDEV file for Feitian U2F devices"
arch=('any')
url="https://www.ftsafe.com/services/Resources?tree_id=209"
license=('custom')
depends=('udev')
source=('https://www.ftsafe.com/download/webdownload/70-u2f.rules')
sha512sums=('8750fcf424c52d31ff7ca42ecd68eb28e318748e863dde55890147d23d8443bb6c34c8218fa73ec41167e991aad186514bc1fa204bb73006d9160cbfae75e7ca')

package() {
	install -D -m644 -t "$pkgdir/usr/lib/udev/rules.d" "$srcdir/70-u2f.rules"
}
