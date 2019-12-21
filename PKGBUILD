# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-autoreglib-1.4-bin
pkgver=36.70
pkgrel=1
epoch=
pkgdesc="minecraft mod library by Vazkii"
arch=('any')
url="https://github.com/Vazkii/AutoRegLib"
license=('custom')
depends=('forge-server')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.jar::https://maven.blamejared.com/vazkii/arl/AutoRegLib/1.4-$pkgver/AutoRegLib-1.4-$pkgver.jar")
noextract=("$pkgname-$pkgver.jar")
md5sums=('4e0984565b2911bf0726b1ec4082ac83')
sha256sums=('9958fad6f1dd7970c0f5283d55472e3926c8a86a0f46fd6acd22c3459de142e9')

package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
}
