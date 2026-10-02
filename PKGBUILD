# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=bocker
pkgver=0.1
pkgrel=1
pkgdesc="Docker implemented in around 100 lines of bash"
arch=('any')
url="https://github.com/p8952/bocker"
license=('GPL-3.0-only')
depends=('bash' 'btrfs-progs' 'util-linux' 'iproute2' 'coreutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a043aaa136a688b69e41ea43a8742cba577a153a7afb48c631386cc3621ff3a0')

package() {
	cd "bocker-$pkgver"
	install -Dm755 bocker "$pkgdir/usr/bin/bocker"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
