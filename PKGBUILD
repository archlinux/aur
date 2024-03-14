# Maintainer: Daniil Cherkovskii <daniillatteru@gmail.com>
pkgname="tnoodle-wca"
pkgver="1.2.2"
pkgrel=1
pkgdesc="Generate WCA scrambles for the Rubik's Cube and other twisty puzzles! // Unofficial Package"
arch=("x86_64")
depends=("java-runtime")
license=("GPL-3.0")
source=("https://github.com/thewca/tnoodle/releases/download/v1.2.2/TNoodle-WCA-1.2.2.jar" "tnoodle.sh")
sha256sums=("151fb27eae66cd0cd335f1717668d26e8530bb5d0266a0c5f871395dcd6237c1" "9c7ab29e77481c576c7f0308580ec0287d4ebad46c84d3b103a4fa8eba79680c")

package() {
	install -D -m 755 "${srcdir}/TNoodle-WCA-1.2.2.jar" "${pkgdir}/usr/share/tnoodle-wca/tnoodle.jar"
	install -D -m 755 "${srcdir}/tnoodle.sh" "${pkgdir}/usr/bin/tnoodle-wca"
	chmod +x "${pkgdir}/usr/bin/tnoodle-wca"
}