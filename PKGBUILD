# Maintainer: Ludvig Holtze <ludvig dot holtze at protonmail dot com>

pkgname=otf-determination
pkgver=1
pkgrel=1
pkgdesc="Determination Sans and Determination Mono: Fonts that mimic the interface in the game Undertale"
url="https://www.behance.net/gallery/31268855/Determination-Better-Undertale-Font"
license=('custom')
arch=('any')
source=('http://download813.mediafire.com/fjc2krhk61zg/2qfrsbd7yks66qk/DTM.ZIP')
sha256sums=('0d618ca53e23e642b07d16e215e957351511992acf0be69e9e55d2844659dcd9')

package() {
	cd "${srcdir}"
	install -Dm644 "DTM-Mono.otf" -t "${pkgdir}/usr/share/fonts/OTF/"
	install -Dm644 "DTM-Sans.otf" -t "${pkgdir}/usr/share/fonts/OTF/"
}
