# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname=bitwarden_fuzzy
pkgver=1.0.3
pkgrel=2
pkgdesc="A none offical fuzzy finder for bitwarden."
arch=('x86_64')
url="https://gitlab.com/TobbeBob123/bitwarden_fuzzy/"
license=('GPL2' 'GPL3')
depends=('bitwarden-cli' 'xclip')
makedepends=('git')
source=("https://gitlab.com/TobbeBob123/bitwarden_fuzzy/-/archive/1.0.3/bitwarden_fuzzy-1.0.3.tar.gz")
sha256sums=('f27b3811f19a857a776020706c8012ece21b33f7e213cabc2b6ae3925b311ab5')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/bff" "$pkgdir/usr/bin/bff"
}
