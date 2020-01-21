# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=snft
pkgver=1.1.1
pkgrel=1
pkgdesc="Script for simple configuring firewall based on nftables."
arch=(any)
url="https://github.com/vvl-rulez/snft"
license=('MIT')
source=("https://github.com/vvl-rulez/snft/archive/v$pkgver.tar.gz")
depends=('nftables')
conflicts=('snft-git')
sha256sums=('d85bee9dd2e498cf0d4697454a21c5bab1f55c141eeef562e90451b47ad08049')
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 snft "$pkgdir/usr/bin/snft"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
