# Maintainer: Callum Webb <callum.s.webb@gmail.com>
pkgname=ninjabrain-bot
pkgver=1.5.1
pkgrel=1
pkgdesc="Stronghold calculator for Minecraft Speedrunning"
arch=(any)
url="https://github.com/Ninjabrain1/Ninjabrain-Bot"
depends=("java-runtime>=8")
license=("unknown")
source=("${url}/releases/download/${pkgver}/Ninjabrain-Bot-${pkgver}.jar"
        "ninjabrain-bot.sh")
noextract=("Ninjabrain-Bot-${pkgver}.jar")
sha256sums=("471bbd0361224ebebd7cb05422646ff912c2d8b9a8b1ac080f20cf21a45caddc"
            "cf7b6f76b63ca82bb96a7b376448a3986d799b1b9bfa58e82b1af3a26dff6514")

package() {
    install -Dm644 "Ninjabrain-Bot-${pkgver}.jar" \
        "${pkgdir}/usr/share/java/${pkgname}/ninjabrain-bot.jar"
    
    install -Dm755 "ninjabrain-bot.sh" \
        "${pkgdir}/usr/bin/${pkgname}"
}
