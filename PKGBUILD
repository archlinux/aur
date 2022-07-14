# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-patches'
pkgver="2.13.6"
pkgrel=1
pkgdesc='Official patches maintained by ReVanced'
arch=('any')
url="https://github.com/revanced/revanced-patches"
license=('GPL3')
depends=('java-environment>=17')
source=("${url}/releases/download/v${pkgver}/revanced-patches-${pkgver}.jar"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('5a150e3ebc7be2722d11adf9f34b2d7d0a6ae51733fae48c19aa894467b79f6f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 revanced-patches-${pkgver}.jar "${pkgdir}/usr/share/revanced/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
