# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: sem.z <sem.z@protonmail.com>
# Contributor: soulsuke <6tsukiyami9@gmail.com>
pkgname=mcaselector
pkgver=2.0
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
sha256sums=('3bbba04fd169c04b0bfa39fae355d68f38dcdb9dacc9e5134aeeee6fc0d71c88'
            '9f97cb7dbdfe2a5871223e7b529d0a621ac342120b53120eaf9d55c5ef9b5b4d'
            'c8aa867604c6eb3e31649cfec02d914aa0ab6cd30080cb7a4aecbecef2254837'
            'f0432cc9fbc63c2c9f5fac891e7a8547dcdf4be8460283e4fc17838de18eb9a4')
noextract=("mcaselector-${pkgver}.jar")
options=(!strip)

package() {
	install -Dm755 "${srcdir}/mcaselector" "${pkgdir}/usr/bin/mcaselector"
	install -Dm755 "${srcdir}/mcaselector-${pkgver}.jar" "${pkgdir}/usr/share/java/mcaselector.jar"
	install -Dm644 "${srcdir}/mcaselector.desktop" "${pkgdir}/usr/share/applications/mcaselector.desktop"
	install -Dm644 "${srcdir}/mcaselector.png" "${pkgdir}/usr/share/pixmaps/mcaselector.png"
}
