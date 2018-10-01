# Maintainer: Your Name <youremail@domain.com>
pkgname=pacman-cache-hooks
pkgver=1.0
pkgrel=3
pkgdesc="Cleanup hooks for pacman's package cache"
arch=('any')
license=('MIT')
depends=('pacman-contrib')
source=("pacman-upgrade.hook" "pacman-remove.hook" "LICENSE")
sha256sums=('36452c7ea20df3c7960772b44a51220a1add40ba952905892b450168e3c66f8b'
            'eada5c38eb145a4ef9a8c8f43514d2bd3cb6d35cae4a15faa1ca2cc7aa9fba37'
            '906b591f18a680e149ee45fde11f1ff7f7dfa645173ce8ca58f47ef8eb7f6298')

package() {
	install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" *.hook
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
