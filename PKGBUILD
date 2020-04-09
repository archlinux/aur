# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=cmpdl
pkgver=1.2.2
pkgrel=1
pkgdesc="A lightweight alternative to Twitch App for downloading Minecraft modpacks"
arch=("any")
url="https://github.com/Vazkii/CMPDL"
license=('MIT')
depends=('minecraft-launcher' 'java-runtime-common')
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
source=("${pkgname}-${pkgver}.jar"::"${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.jar"
        "${pkgname}.desktop")
noextract=()
md5sums=('5caa35cee04de72d50164caf116b00c2'
         'b7b3e3e0228eef1d60ee934e3ad82b11')
validpgpkeys=()

package() {
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/cmpdl/${pkgname}.jar"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

