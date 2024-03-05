# Maintainer: Abdur-Rahman Mansoor <armansoor at posteo dot net>

pkgname='dnsleaktest'
pkgver=1.3
pkgrel=2
url="https://github.com/macvk/$pkgname"
pkgdesc='An open source script that tests VPN connection for DNS leak'
arch=('any')
depends=('curl' 'bash' 'coreutils')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/macvk/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b29e255d6473cc3f05f76462e5cc8ef3d5b56e6546a7b667fc8a03160aff211b104f3adf69fb4b1d99f5a8789b957afcf163de471871552bd65a619ca5827a6e')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./dnsleaktest.sh "$pkgdir/usr/bin/dnsleaktest"
	install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}


