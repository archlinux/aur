# Maintainer: Aline Abler <alinea@riseup.net>

pkgname=ttf-metamorphous
pkgver=20231228
pkgrel=3
_commit="ea42b7c32f18e96539fafbe3e04f0133332df032"  # Latest commit touching the metamorphous tree
pkgdesc='Metamorphous Font'
url="https://fonts.google.com/specimen/Metamorphous"
license=("OFL-1.1-RFN")
arch=('any')
source=("https://github.com/google/fonts/raw/$_commit/ofl/metamorphous/Metamorphous-Regular.ttf"
        "https://github.com/google/fonts/raw/$_commit/ofl/metamorphous/OFL.txt")
sha256sums=('55939a5664e06807e87fa4af64f52039ead12f002dda8317393fdce2f7ff57fe'
            '4fece81b541808b40293b0cd3f5b1990274e1100e1c20455dc2987cd96639d3f')

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
