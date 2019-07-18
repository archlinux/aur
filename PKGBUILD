# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=cmpdl
pkgver=2.3.0
pkgrel=1
pkgdesc="A lightweight alternative to Twitch App for downloading Minecraft modpacks"
arch=("any")
url="https://github.com/Franckyi/CMPDL"
license=('MIT')
depends=('minecraft-launcher' 'java-runtime-openjdk=8' 'java-openjfx=8')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.jar"::"https://github.com/Franckyi/CMPDL/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar"
        "${pkgname}.desktop")
noextract=()
md5sums=('5e8176fbc682497a0badc1c835db01ae'
         'f1e4aff9765a065c95a652c9ec7228b6')
validpgpkeys=()

package() {
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/cmpdl/${pkgname}.jar"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

