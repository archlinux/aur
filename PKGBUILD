# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-quark-2.0-bin
pkgver=204.882
pkgrel=3
epoch=
pkgdesc="minecraft mod quark by Vazkii"
arch=('any')
url="https://quark.vazkii.net/"
license=('custom:CC BY-NC-SA 3.0')
depends=('forge-server>=1.14.4_28.1.61' 'forge-autoreglib-1.4-bin')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.jar::https://maven.blamejared.com/vazkii/quark/Quark/r2.0-$pkgver/Quark-r2.0-$pkgver.jar")
noextract=("$pkgname-$pkgver.jar")
md5sums=('677ec9834271fb86f0219692c0d6aa53')
sha256sums=('0285c40492c8a3ce98a74746985c958d0ee6af3f5fc56817d2768738b1394f42')

package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
} 
