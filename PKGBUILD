pkgname=lightdm-webkit2-theme-plant
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern LightDM WebKit2 theme with 3D model and customizable interface"
arch=('any')
url="https://github.com/samay15jan/lightdm-webkit2-theme-plant"
license=('MIT')

depends=(
    'lightdm'
    'lightdm-webkit2-greeter'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/samay15jan/lightdm-webkit2-theme-plant/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes"

    cp -r "$srcdir/lightdm-webkit2-theme-plant-$pkgver" \
        "$pkgdir/usr/share/lightdm-webkit/themes/plant"
}
