# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname=bitwarden-fuzzy
pkgver=1.0.7
pkgrel=1
pkgdesc="A unoffical fuzzy finder for bitwarden."
provides=('bitwarden-fuzzy')
conflicts=('bitwarden_fuzzy')
replaces=('bitwarden_fuzzy')
arch=('any')
url="https://gitlab.com/TobbeBob123/bitwarden-fuzzy/"
license=('GPL2' 'GPL3')
depends=('bitwarden-cli' 'xclip')
source=("https://gitlab.com/TobbeBob123/bitwarden-fuzzy/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('15d5c8f974f63978bc2e8f62b3a0cc32cf405739b3f67dd2c3fdcfec00fb4f51')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/bff" "$pkgdir/usr/bin/bff"
	install -Dm644 "$srcdir/${pkgname}-$pkgver/bff.1.gz" "$pkgdir/usr/share/man/man1/bff.1.gz"
}
