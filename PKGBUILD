# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname="web-search"
pkgver=1.0.0
pkgrel=1
pkgdesc="A way to search the web without needing to open browser first."
arch=('x86_64')
url="https://gitlab.com/TobbeBob123/web-search"
license=('GPL2' 'GPL3')
depends=('yad')
makedepends=('git')
source=("https://gitlab.com/TobbeBob123/web-search/-/archive/1.0.0/web-search-1.0.0.tar.gz")
sha256sums=('1b7e52f7f0c6359a15f834948b110d2b9be665581acfa871c68a3bbac4e88430')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/web-search" "$pkgdir/usr/bin/web-search"
}
