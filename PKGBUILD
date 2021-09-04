# Maintainer: Leon Schumacher <leonsch@protonmail.com>
pkgname=hdb
pkgver=1
pkgrel=1
pkgdesc="The Hierarchical Database"
arch=('any')
url="https://github.com/42LoCo42/hdb"
license=('GPL3')
depends=('bash')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('79ee47e4d79baf07555bbbb1538e3089a269cea3475e38763478cd0d6273fae3')

package() {
	cd "$pkgname-$pkgver"
	install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
