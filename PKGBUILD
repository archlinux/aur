# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-integrations'
pkgver="0.45.0"
pkgrel=1
pkgdesc='Integrations containing helper classes for ReVanced. Originally maintained by Vanced.'
arch=('any')
url="https://github.com/revanced/revanced-integrations"
license=('GPL3')
depends=('revanced-cli')
source=("integrations-${pkgver}.apk::${url}/releases/download/v${pkgver}/app-release-unsigned.apk"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('28ab1389440559c8181f44e8bdcae7be0eeb8b361b08b724c56b35f91441af72'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 integrations-${pkgver}.apk "${pkgdir}/usr/share/revanced/integrations.apk"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
