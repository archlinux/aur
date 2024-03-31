# Maintainer: 46620 <46620osu@gmail.com>
pkgname='revanced-patches-bin'
pkgver=4.5.0
pkgrel=1
pkgdesc='Patches for ReVanced'
arch=('any')
url="https://github.com/revanced/revanced-patches"
license=('GPL3')
depends=('java-environment>=17')
provides=('revanced-patches')
conflicts=('revanced-patches')
source=("${url}/releases/download/v${pkgver}/revanced-patches-${pkgver}.jar"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('d67ce1352fd9a2c32e70b47be0aa1d83d2c9a49bb9736a1368a159125ab8ce76'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 revanced-patches-${pkgver}.jar "${pkgdir}/usr/share/revanced/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
