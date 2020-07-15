# Maintainer: PilzAdam <pilzadam@gmx.de>

pkgname=simple-restart-check
pkgver=1.0.0
pkgrel=2
pkgdesc='A simple Bash script that checks if processes use outdated libraries.'
arch=('any')
url='https://github.com/PilzAdam/simple-restart-check'
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PilzAdam/simple-restart-check/archive/v1.0.0.tar.gz")

package() {
	cd "$pkgname-$pkgver"

	# install main script without .sh suffix
	install -Dm755 -T "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

	install -Dm644  "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=('3177a6a4e3006816f6107fbf88792630269ea392aa10874bbfa23eb9fb6c86b1')
