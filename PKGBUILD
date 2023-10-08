# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-integrations'
pkgver="0.119.0"
pkgrel=1
pkgdesc='Integrations containing helper classes for ReVanced. Originally maintained by Vanced.'
arch=('any')
url="https://github.com/revanced/revanced-integrations"
license=('GPL3')
depends=('revanced-cli')
source=("integrations-${pkgver}.apk::${url}/releases/download/v${pkgver}/revanced-integrations-${pkgver}.apk"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('fe4eb9498b677030e180c7e93740a66ab6156e33fc0e7b40503f97f8965d79d9'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 integrations-${pkgver}.apk "${pkgdir}/usr/share/revanced/integrations.apk"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
