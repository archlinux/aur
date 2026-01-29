# Maintainer: Den Shakhov <denshakhovse@gmail.com>

pkgname=git-heatgrid
pkgver=1.2.0
pkgrel=1
pkgdesc="Visualize git commits as a calendar heatmap"
arch=('any')
url="https://github.com/denshakhov/git-heatgrid"
license=('MIT')
depends=('bash>=5.0.0' 'coreutils' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9a02fd9b18312a0c65a99609861ebd776791d810ed81f2b9d4cf5eb157b17814')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 config.conf "$pkgdir/usr/share/doc/$pkgname/config.conf.example"
	install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
