# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-villager-names-bin
pkgver=1.0.1
pkgrel=2
epoch=
pkgdesc="Minecraft mod to assign names to villagers"
arch=('any')
url="https://github.com/F43nd1r/minecraft-villager-names"
license=('Apache')
depends=('forge-server')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.jar::https://github.com/F43nd1r/minecraft-villager-names/releases/download/v$pkgver/villager-names-$pkgver.jar")
noextract=("$pkgname-$pkgver.jar")
sha256sums=('e3c43a1645a3a003eec2842872d0aa71c75de57521056e7980ab28ff45508fdd')

package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
} 
