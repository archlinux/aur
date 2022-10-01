# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-patches'
pkgver="2.76.3"
pkgrel=1
pkgdesc='Official patches maintained by ReVanced'
arch=('any')
url="https://github.com/revanced/revanced-patches"
license=('GPL3')
depends=('java-environment>=17')
source=("${url}/releases/download/v${pkgver}/revanced-patches-${pkgver}.jar"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('35ab4b1db768bd076af44f4a6d76fa0151a7cc21d9f270cb1248fb6c5aa4ac01'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 revanced-patches-${pkgver}.jar "${pkgdir}/usr/share/revanced/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
