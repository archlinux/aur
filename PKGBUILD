# Maintainer: Edvin Hultberg <hultberg@mittnett.net>

pkgname=git-fresh
pkgver=1.11.0
pkgrel=1
pkgdesc='Keep your repo fresh with one command.'
arch=('any')
url='https://github.com/imsky/git-fresh'
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/imsky/git-fresh/archive/v$pkgver.tar.gz")
sha256sums=('b8504e633c679b5112fc7ccfea354c4ceb01f9d6aa681abf09dc7c9564a7e38f')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./git-fresh $pkgdir/usr/share/bin/git-fresh

	install -dm655 $pkgdir/usr/share/licenses/git-fresh
	cp ./LICENSE $pkgdir/usr/share/licenses/git-fresh
	cp ./README.md $pkgdir/usr/share/licenses/git-fresh
}
