# Maintainer: 46620 <46620osu@gmail.com>
pkgname='revanced-integrations-bin'
pkgver=1.11.1
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
sha256sums=('c0fbebd6748c1e7101da9dd6565098498d0c7d7b08a56200671a1933296e465e'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 integrations-${pkgver}.apk "${pkgdir}/usr/share/revanced/integrations.apk"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
