# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-integrations'
pkgver="0.14.0"
pkgrel=1
pkgdesc='Integrations containing helper classes for ReVanced. Originally maintained by Vanced.'
arch=('any')
url="https://github.com/revanced/revanced-integrations"
license=('GPL3')
depends=('revanced-cli')
source=("${url}/releases/download/v${pkgver}/app-release-unsigned.apk"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('37804a6d2ea63bc63c12dbf30953a6fdbf45e97ec9d2cd3b1c6f21ea326a83fd'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 app-release-unsigned.apk "${pkgdir}/usr/share/revanced/integrations.apk"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
