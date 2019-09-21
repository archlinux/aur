# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=mindustry-server
pkgver=94
pkgrel=1
pkgdesc="Server of a sandbox tower defense game written in Java"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("GPL3")
depends=("java-runtime=8")
source=("${pkgname}-${pkgver}.jar::https://github.com/Anuken/Mindustry/releases/download/v${pkgver}/server-release.jar"
        "${pkgname}.sh")
md5sums=('0cf42133dc673d6d17ac3592c162c784'
         '60eaa447ed6bbb47a183b2118d7b3010')
noextract=("${pkgname}-${pkgver}.jar")

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/server-release.jar"
}
