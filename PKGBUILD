# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: sem.z <sem.z@protonmail.com>
pkgname=mcaselector
pkgver=1.16.3
pkgrel=1
pkgdesc="An external tool to export or delete selected chunks and regions from a world save of Minecraft Java Edition."
arch=(any)
url="https://github.com/Querz/mcaselector"
license=('MIT')
depends=('jre-openjdk' 'java-openjfx' 'bash')
source=("mcaselector-${pkgver}.jar::https://github.com/Querz/mcaselector/releases/download/${pkgver}/mcaselector-${pkgver}.jar"
		"mcaselector.desktop"
		"mcaselector.png"
		"mcaselector")
sha256sums=('0a9850acdd947f9d482015c9e47eb2df400e95290e6d93260d5adf996e2c2d47'
            '9f97cb7dbdfe2a5871223e7b529d0a621ac342120b53120eaf9d55c5ef9b5b4d'
            'c8aa867604c6eb3e31649cfec02d914aa0ab6cd30080cb7a4aecbecef2254837'
            '638f77d331168fa64d7900f5781d27674d80baf651627dec8c273c3c39c8f968')
noextract=("mcaselector-${pkgver}.jar")
options=(!strip)

package() {
	install -Dm755 "${srcdir}/mcaselector" "${pkgdir}/usr/bin/mcaselector"
	install -Dm755 "${srcdir}/mcaselector-${pkgver}.jar" "${pkgdir}/usr/share/java/mcaselector.jar"
	install -Dm644 "${srcdir}/mcaselector.desktop" "${pkgdir}/usr/share/applications/mcaselector.desktop"
	install -Dm644 "${srcdir}/mcaselector.png" "${pkgdir}/usr/share/pixmaps/mcaselector.png"
}
