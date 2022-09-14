# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=otf-monocraft
pkgver=1.3
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=('custom:OFL')
source=("Monocraft-$pkgver.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9682462eff904a093160b8fb6ab7e4a6dea3d15a948d720619fbf0be53985c14')


package() {
    cd "Monocraft-$pkgver"

    install -Dm644 "Monocraft.otf" "$pkgdir/usr/share/fonts/OTF/Monocraft.otf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
