# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-knightminer-bin
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="Mod adding various smaller features to Minecraft "
arch=('any')
url="https://github.com/KnightMiner/Inspirations"
license=('custom:CC BY-NC-SA 4.0')
depends=('forge-server')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.jar::https://github.com/KnightMiner/Inspirations/releases/download/$pkgver/Inspirations-1.14.4-$pkgver.jar")
noextract=("$pkgname-$pkgver.jar")
md5sums=('3b95fc5e69d935f4df3c6862e2c183c8')
sha256sums=('37ac9d7d9700e22209ceaa1fe2ba31115c9f064fa25a53b62e05248e6f966da9')

package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
} 
