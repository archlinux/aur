# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=otf-monocraft
pkgver=1.2
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=('custom:OFL')
source=("Monocraft-$pkgver.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b8fa5d621819b7895d08f0f355e4166198748b19dfdf5ecd4799b2c6e13dafbd')


package() {
    cd "Monocraft-$pkgver"

    install -Dm644 "Monocraft.otf" "$pkgdir/usr/share/fonts/OTF/Monocraft.otf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
