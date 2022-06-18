# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-patches'
pkgver="1.6.3"
pkgrel=1
pkgdesc='Official patches maintained by ReVanced'
arch=('any')
url="https://github.com/revanced/revanced-patches"
license=('GPL3')
depends=('java-environment')
source=("${url}/releases/download/v${pkgver}/revanced-patches-${pkgver}.jar"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('SKIP'
            'SKIP')

package() {
  install -Dm 755 revanced-patches-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
