# Maintainer: Daniil Cherkovskii <daniillatteru@gmail.com>
pkgname="tnoodle-wca"
pkgver="1.1.2"
pkgrel=1
pkgdesc="Generate WCA scrambles for the Rubik's Cube and other twisty puzzles! // Unofficial Package"
arch=("x86_64")
depends=("java-runtime")
license=("GPL-3.0")
source=("https://www.worldcubeassociation.org/regulations/scrambles/tnoodle/TNoodle-WCA-1.1.2.jar" "tnoodle.sh")
sha256sums=("1d6177a68a8eb1276f495d9f9ae31ad46876970b888b602d2ffdf485419acccc" "9c7ab29e77481c576c7f0308580ec0287d4ebad46c84d3b103a4fa8eba79680c")

package() {
	install -D -m 755 "${srcdir}/TNoodle-WCA-1.1.2.jar" "${pkgdir}/usr/share/tnoodle-wca/tnoodle.jar"
	install -D -m 755 "${srcdir}/tnoodle.sh" "${pkgdir}/usr/bin/tnoodle-wca"
	chmod +x "${pkgdir}/usr/bin/tnoodle-wca"
}
