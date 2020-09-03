# Maintainer: Cerebrux <mail@cerebrux.net>
pkgname=sysglance
pkgver=1.1
pkgrel=1
pkgdesc="Linux utility for generating a report for the host system."
arch=( 'any' )
url="https://github.com/Utappia/sysglance"
license=('GPL3')
depends=('systemd' 'pciutils' 'usbutils' 'util-linux' 'curl' )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Utappia/sysglance/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 sysglance.sh "$pkgdir/usr/bin/sysglance"
}
