# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=snft
pkgver=1.1.1
pkgrel=1
pkgdesc="Script for simple configuring firewall based on nftables."
arch=(any)
url="https://github.com/vvl-rulez/snft"
license=('MIT')
source=("https://github.com/vvl-rulez/snft/archive/v1.1.1.tar.gz")
depends=('nftables')
conflicts=('snft-git')
sha256sums=('SKIP')
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 snft "$pkgdir/usr/bin/snft"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
