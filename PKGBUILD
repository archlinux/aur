# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=quickemu
pkgver=2.2.3
pkgrel=1
pkgdesc="Quickly create and run optimised Windows, macOS and Linux desktop virtual machines."
arch=(any)
url="https://github.com/wimpysworld/quickemu"
license=('MIT')
depends=('qemu')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz"::'https://github.com/wimpysworld/quickemu/archive/refs/tags/2.2.3.tar.gz')
md5sums=("38cbaa95a18a6c98b9444a49263c64d4")

package() {
	cd "$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 quickemu "$pkgdir/usr/bin/quickemu"
	install -Dm755 macrecovery "$pkgdir/usr/bin/macrecovery"
	install -Dm755 quickget "$pkgdir/usr/bin/quickget"
}
