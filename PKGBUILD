# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=otf-monocraft
pkgver=1.4
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=('custom:OFL')
source=("Monocraft-$pkgver.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3dd301aac89a02bab330c24a7e57ae933e291e659b9006b2baa5cc58c0562fe9')


package() {
    cd "Monocraft-$pkgver"

    install -Dm644 "Monocraft.otf" "$pkgdir/usr/share/fonts/OTF/Monocraft.otf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
