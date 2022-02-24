# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch"
pkgver=5.0.2
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://github.com/ThatOneCalculator/NerdFetch"
license=('GPL')
makedepends=('git')
source=("https://github.com/ThatOneCalculator/NerdFetch/archive/refs/tags/v${pkgver}.tar.gz")
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
