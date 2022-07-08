# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-integrations'
pkgver="0.21.8"
pkgrel=1
pkgdesc='Integrations containing helper classes for ReVanced. Originally maintained by Vanced.'
arch=('any')
url="https://github.com/revanced/revanced-integrations"
license=('GPL3')
depends=('revanced-cli')
source=("${url}/releases/download/v${pkgver}/app-release-unsigned.apk"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('9cff3085421ae18f7d6a81cd2e154f06d1b6e8234538b41135023f2eac3a4726'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 app-release-unsigned.apk "${pkgdir}/usr/share/revanced/integrations.apk"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
