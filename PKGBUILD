# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch"
pkgver=5.0.2
pkgrel=2
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://codeberg.org/thatonecalculator/NerdFetch"
license=('GPL')
makedepends=('git')
source=("https://codeberg.org/thatonecalculator/NerdFetch/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

prepare() {
	tar -xf "v${pkgver}.tar.gz"
	cd "NerdFetch-${pkgver}"
}

package() {
	install -Dm755 "${srcdir}/NerdFetch-${pkgver}/nerdfetch" "$pkgdir/usr/bin/nerdfetch"
	install -Dm644 "${srcdir}/NerdFetch-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname"
}
