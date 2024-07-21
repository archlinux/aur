# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
pkgname="nerdfetch"
pkgver=8.2.0
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://github.com/thatonecalculator/NerdFetch"
license=('MIT')
depends=('which')
optdepends=('nerd-fonts: NerdFont to show icons in fetch')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thatonecalculator/NerdFetch/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('4f3063c4c31f0cb95fc50af5e418149eef6829fc92314031f3f69d5eb2a4a77c')

sourcedir="NerdFetch-${pkgver}"

package() {
	install -Dm755 "${srcdir}/${sourcedir}/nerdfetch" "$pkgdir/usr/bin/nerdfetch"
	install -Dm644 "${srcdir}/${sourcedir}/README.md" "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "${srcdir}/${sourcedir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
