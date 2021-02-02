# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor:F43nd1r <support@faendir.com>

pkgname=forge-knightminer-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Mod adding various smaller features to Minecraft"
arch=('any')
url="https://github.com/KnightMiner/Inspirations"
license=('MIT')
depends=('forge-server')
source=("$pkgname-$pkgver.jar::https://github.com/KnightMiner/Inspirations/releases/download/$pkgver/Inspirations-1.16.5-$pkgver.jar")
noextract=("$pkgname-$pkgver.jar")
sha256sums=('6d03080fbd444bc2f0c4e8641726d62fa741fc48753f9f8a7679e54b5ebf4c05')

package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
} 