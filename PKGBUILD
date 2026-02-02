# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname=bitwarden-fuzzy
pkgver=1.3.9
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
sha256sums=('dc467829ef874b4c82cc651807ccdb448c148cff0348a1df9cbeb981727fa4eb')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/bff" "$pkgdir/usr/bin/bff"
	install -Dm644 "$srcdir/${pkgname}-$pkgver/bff.1.gz" "$pkgdir/usr/share/man/man1/bff.1.gz"
	install -Dm644 "$srcdir/${pkgname}-$pkgver/bff.desktop" "$pkgdir/usr/share/applications/bff.desktop"
}
