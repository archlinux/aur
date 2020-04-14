# Maintainer: Edvin Hultberg <hultberg@mittnett.net>

pkgname=git-fresh
pkgver=1.12.1
pkgrel=1
pkgdesc='Keep your repo fresh with one command.'
arch=('any')
url='https://github.com/imsky/git-fresh'
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/imsky/git-fresh/archive/v$pkgver.tar.gz")
sha256sums=('48be2629113ba77a2a6d8fd478b7186f7237669e9495e768b9d3133704c49dde')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./git-fresh $pkgdir/usr/bin/git-fresh

	install -dm655 $pkgdir/usr/share/licenses/git-fresh
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/git-fresh/LICENSE
	install -Dm644 ./README.md $pkgdir/usr/share/licenses/git-fresh/README.md
	install -Dm644 ./README.md $pkgdir/usr/share/licenses/git-fresh/README.md

	install -Dm644 ./git-fresh.1 $pkgdir/usr/share/man/man1/git-fresh.1
}
