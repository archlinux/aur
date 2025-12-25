# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname=bitwarden_fuzzy
pkgver=1.0.0
pkgrel=1
pkgdesc="A none offical fuzzy finder for bitwarden."
arch=('x86_64')
url="https://gitlab.com/TobbeBob123/bitwarden_fuzzy/"
license=('GPL2' 'GPL3')
depends=('bitwarden-cli' 'xclip')
makedepends=('git')
source=("https://gitlab.com/TobbeBob123/bitwarden_fuzzy/-/archive/1.0.0/bitwarden_fuzzy-1.0.0.tar.gz")
sha256sums=('80edbde27edf795053611c0ba268ea4c49106aea233b08c5c1725a581ca53c6e')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/bitwarden_fuzzy_finder" "$pkgdir/usr/bin/bitwarden_fuzzy_finder"
}
