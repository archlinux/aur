# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname=bitwarden_fuzzy
pkgver=1.0.3
pkgrel=3
pkgdesc="A none offical fuzzy finder for bitwarden."
arch=('x86_64')
url="https://gitlab.com/TobbeBob123/bitwarden_fuzzy/"
license=('GPL2' 'GPL3')
depends=('bitwarden-cli' 'xclip')
makedepends=('git')
source=("https://gitlab.com/TobbeBob123/bitwarden_fuzzy/-/archive/1.0.3/bitwarden_fuzzy-1.0.3.tar.gz")
sha256sums=('7722a70a5a5f335cab5ec12d7e4f2ba453e46ec4826c76e45f31f3f4b204a745')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/bff" "$pkgdir/usr/bin/bff"
}
