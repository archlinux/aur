# Maintainer: Edvin Hultberg <hultberg@mittnett.net>

pkgname=git-fresh
pkgver=1.13.0
pkgrel=1
pkgdesc='Keep your repo fresh with one command.'
arch=('any')
url='https://github.com/imsky/git-fresh'
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/imsky/git-fresh/archive/v$pkgver.tar.gz")
sha256sums=('7043aaf2bf66dade7d06ebcf96e5d368c4910c002b7b00962bd2bd24490ce2dc')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./git-fresh $pkgdir/usr/bin/git-fresh

	install -dm655 $pkgdir/usr/share/licenses/git-fresh
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/git-fresh/LICENSE
	install -Dm644 ./README.md $pkgdir/usr/share/licenses/git-fresh/README.md
	install -Dm644 ./README.md $pkgdir/usr/share/licenses/git-fresh/README.md

	install -Dm644 ./git-fresh.1 $pkgdir/usr/share/man/man1/git-fresh.1
}
