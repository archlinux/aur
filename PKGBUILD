# Maintainer: Abdur-Rahman Mansoor <mansoorar at proton dot me>

pkgname='dnsleaktest'
pkgver=1.3
pkgrel=1
url="https://github.com/macvk/$pkgname"
pkgdesc='An open source script that tests VPN connection for DNS leak'
arch=('any')
depends=('curl')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/macvk/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b29e255d6473cc3f05f76462e5cc8ef3d5b56e6546a7b667fc8a03160aff211b104f3adf69fb4b1d99f5a8789b957afcf163de471871552bd65a619ca5827a6e')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./dnsleaktest.sh "$pkgdir/usr/bin/dnsleaktest"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}


