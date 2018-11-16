# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=netctl-dispatcher-chrony
pkgver=0.1.1
pkgrel=2
pkgdesc="A netctl dispatcher script for chrony"
arch=('any')
url="https://github.com/bertptrs/netctl-dispatcher-chrony"
license=('MIT')
depends=('netctl' 'wpa_actiond' 'chrony')
source=("https://github.com/bertptrs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('68e8b0027e89fcc21d19b0780b4d914e81a7e39fa6976b113f2db0168a5327f4')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m 755 chrony-dispatcher "$pkgdir/etc/netctl/hooks/chrony-dispatcher"
}
