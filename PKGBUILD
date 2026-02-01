# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
pkgname="nerdfetch"
pkgver=8.5.0
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://github.com/thatonecalculator/NerdFetch"
license=('MIT')
depends=()
optdepends=('nerd-fonts: NerdFont to show icons in fetch')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thatonecalculator/NerdFetch/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('c2fb7e7fc33690a69b7beaf6473d56c882a44ba3bbe63150f45a97f107220741')
provides=('nerdfetch')
conflicts=('nerdfetch-git')

sourcedir="NerdFetch-${pkgver}"

package() {
	install -Dm755 "${srcdir}/${sourcedir}/nerdfetch" "$pkgdir/usr/bin/nerdfetch"
	install -Dm644 "${srcdir}/${sourcedir}/README.md" "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "${srcdir}/${sourcedir}/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname"
}
