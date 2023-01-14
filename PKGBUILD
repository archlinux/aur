# Maintainer: Daniil Cherkovskii <daniillatteru@gmail.com>
pkgname="tnoodle-cli"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Generate WCA scrambles for the Rubik's Cube and other twisty puzzles on the command line! // Unofficial Package"
arch=("x86_64")
depends=("java-runtime")
license=("GPL-3.0")
source=("https://github.com/SpeedcuberOSS/tnoodle-cli/releases/download/v1.0.0/tnoodle-cli-1.0.0.jar" "tnoodle.sh")
sha256sums=("8e2f7e2e61493463d12bba3ab9d43bfa1bbf9674910c1ffa99788c125512036e" "856f708120826ece2107e0ea0596d5a1dc01560e1e305f3fd33bbee51d5566f0")

package() {
	install -D -m 755 "${srcdir}/tnoodle-cli-1.0.0.jar" "${pkgdir}/usr/share/tnoodlecli/tnoodle.jar"
	install -D -m 755 "${srcdir}/tnoodle.sh" "${pkgdir}/usr/bin/tnoodle"
	chmod +x "${pkgdir}/usr/bin/tnoodle"
}
