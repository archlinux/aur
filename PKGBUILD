# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname=bitwarden-fuzzy
pkgver=1.2.3
pkgrel=1
pkgdesc="An unoffical fuzzy finder for bitwarden."
provides=('bitwarden-fuzzy')
conflicts=('bitwarden_fuzzy')
replaces=('bitwarden_fuzzy')
arch=('any')
url="https://gitlab.com/TobbeBob123/bitwarden-fuzzy/"
license=('GPL2' 'GPL3')
depends=('bitwarden-cli' 'xclip')
source=("https://gitlab.com/TobbeBob123/bitwarden-fuzzy/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('57b350d3e494b31759e005b9816b63a23e9f357c4817f95498adb3ac20dd7137')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/bff" "$pkgdir/usr/bin/bff"
	install -Dm644 "$srcdir/${pkgname}-$pkgver/bff.1.gz" "$pkgdir/usr/share/man/man1/bff.1.gz"
	install -Dm644 "$srcdir/${pkgname}-$pkgver/bff.desktop" "$pkgdir/usr/share/applications/bff.desktop"
}
