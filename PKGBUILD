# Maintainer: Ashton Grimes <amgrimes2002@gmail.com>

pkgname=cpcli-git
pkgver=1.1.0
pkgrel=1
pkgdesc="Check crypto prices in your terminal"
arch=(any)
url="https://github.com/AshtonGrimes/cpcli"
license=(GPL-3.0-or-later)
depends=(guile guile-json)
makedepends=(git)
source=("git+https://github.com/AshtonGrimes/cpcli")
sha256sums=(SKIP)

package() {
	cd cpcli
	install -Dm755 cpcli.scm -T "$pkgdir/usr/bin/cpcli"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
