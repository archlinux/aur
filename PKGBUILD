# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-autoreglib-1.4-bin
pkgver=36.71
pkgrel=1
epoch=
pkgdesc="Minecraft mod library by Vazkii"
arch=('any')
url="https://github.com/Vazkii/AutoRegLib"
license=('custom')
depends=('forge-server')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.jar::https://maven.blamejared.com/vazkii/arl/AutoRegLib/1.4-$pkgver/AutoRegLib-1.4-$pkgver.jar" "LICENSE")
noextract=("$pkgname-$pkgver.jar")
sha1sums=('48cda227232d0777897c51af302bfea8468f1701'
          '6280575615d8e517935d30317cfdec7c5a4b6aff')

package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
