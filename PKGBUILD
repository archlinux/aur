# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=otf-monocraft
pkgver=1.1
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=('custom:OFL')
source=("Monocraft-$pkgver.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v1.1.tar.gz")
sha256sums=('d2c52ccda44d34af2087863eae51099840977a638702ffccca791ec28671154e')


package() {
    cd "Monocraft-$pkgver"

    install -Dm644 "Monocraft.otf" "$pkgdir/usr/share/fonts/OTF/Monocraft.otf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
