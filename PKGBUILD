# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=dockcheck
pkgver=0.4.6
pkgrel=1
pkgdesc="CLI tool to automate docker image updates. No pre-pull, selective, notify, prune."
arch=("any")
url="https://github.com/mag37/dockcheck"
license=("GPL-3.0-only")
depends=()
source=("https://github.com/mag37/dockcheck/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("581217461c79d873271e1a99bf771c165d44d0cb7c4b1806fe92f9fa6387f690")

package() {
	cd "$pkgname-$pkgver"
	install -D dockcheck.sh $pkgdir/usr/bin/$pkgname
	install -D LICENSE $pkgdir/usr/share/licenses/LICENSE
	install -D README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -D notify*.sh -t $pkgdir/usr/share/$pkgname/
}
