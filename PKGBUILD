# Maintainer: adogecheems <adogecheems at outlook dot com>
pkgname=monika-after-story-tr-cn
pkgver=0.12.17.0
pkgrel=1
pkgdesc="A third-party Chinese language patch for the Monika After Story."
arch=(
    'any'
)
url="https://github.com/Mon1-innovation/MAS-Simplified-Chinese-Patch"
license=('custom')
depends=('ddlc-mas')
source=(
    "https://github.com/Mon1-innovation/MAS-Simplified-Chinese-Patch/releases/download/$pkgver/chs.rpa"
    "https://github.com/Mon1-innovation/MAS-Simplified-Chinese-Patch/releases/download/$pkgver/chs_gui.rpa"
)
sha256sums=(
    '680da91bc6246feb36dad12c18e999c07ebc068a1cb5cdc5b4f4b9e492d820b8'
    'd5c09635c0d7dc8e0444fa754eb37ba699856b6b47cf5af51bd2c5201181942f'
)
package() {
    install -Dm644 "$srcdir/chs.rpa" "$pkgdir/opt/monika-after-story/game/chs.rpa"
    install -Dm644 "$srcdir/chs_gui.rpa" "$pkgdir/opt/monika-after-story/game/chs_gui.rpa"
}
