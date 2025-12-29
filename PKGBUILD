# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname=bitwarden-fuzzy
pkgver=1.0.4
pkgrel=2
pkgdesc="A unoffical fuzzy finder for bitwarden."
provides=('bitwarden-fuzzy')
conflicts=('bitwarden_fuzzy')
replaces=('bitwarden_fuzzy')
arch=('any')
url="https://gitlab.com/TobbeBob123/bitwarden-fuzzy/"
license=('GPL2' 'GPL3')
depends=('bitwarden-cli' 'xclip')
source=("https://gitlab.com/TobbeBob123/bitwarden-fuzzy/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c4dd7835fbcf2c6714c8f07e09dd98e904e1a4b68d7e6aa7e3f8e4abb5e700f2')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/bff" "$pkgdir/usr/bin/bff"
	install -Dm644 "$srcdir/${pkgname}-$pkgver/bff.1.gz" "$pkgdir/usr/share/man/man1/bff.1.gz"
}
