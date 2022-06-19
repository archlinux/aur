# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-patches'
pkgver="1.6.4"
pkgrel=1
pkgdesc='Official patches maintained by ReVanced'
arch=('any')
url="https://github.com/revanced/revanced-patches"
license=('GPL3')
depends=('java-environment' 'revanced-cli')
source=("${url}/releases/download/v${pkgver}/revanced-patches-${pkgver}.jar"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('6b688d2fd4339f253eb8fc3758effae6714920bc08c019e415c9166c5a940cb6'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 revanced-patches-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
