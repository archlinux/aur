# Maintainer: Edvin Hultberg <hultberg@mittnett.net>

pkgname=git-fresh
pkgver=1.12.0
pkgrel=1
pkgdesc='Keep your repo fresh with one command.'
arch=('any')
url='https://github.com/imsky/git-fresh'
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/imsky/git-fresh/archive/v$pkgver.tar.gz")
sha256sums=('199a35e695a839609159b08667c19d361716d882fc5e44a8ec164dc580fb1edc')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./git-fresh $pkgdir/usr/bin/git-fresh

	install -dm655 $pkgdir/usr/share/licenses/git-fresh
	cp ./LICENSE $pkgdir/usr/share/licenses/git-fresh
	cp ./README.md $pkgdir/usr/share/licenses/git-fresh
}
