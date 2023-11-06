# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-integrations-bin'
pkgver="0.121.0"
pkgrel=1
pkgdesc='Integrations containing helper classes for ReVanced. Originally maintained by Vanced.'
arch=('any')
url="https://github.com/revanced/revanced-integrations"
license=('GPL3')
depends=('revanced-cli')
provides=('revanced-integrations')
conflicts=('revanced-integrations')
source=("integrations-${pkgver}.apk::${url}/releases/download/v${pkgver}/revanced-integrations-${pkgver}.apk"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('31c1699673406dd9080adcc9b591da34ee69aee777fe89e9daa7b6e39933b4b8'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 integrations-${pkgver}.apk "${pkgdir}/usr/share/revanced/integrations.apk"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
