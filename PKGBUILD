# Maintainer: Den Shakhov <denshakhovse@gmail.com>

pkgname=git-heatgrid
pkgver=1.1.0
pkgrel=1
pkgdesc="Visualize git commits as a calendar heatmap"
arch=('any')
url="https://github.com/denshakhov/git-heatgrid"
license=('MIT')
depends=('bash>=5.0.0' 'coreutils' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d7fea3b5693e8e071fd1bb854b066a85cc953fdb2b0642ff81dae62a0518a7d1')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 config.conf "$pkgdir/usr/share/doc/$pkgname/config.conf.example"
	install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
