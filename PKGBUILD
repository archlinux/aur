# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-patches-bin'
pkgver="2.194.0"
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
sha256sums=('9b7a28a83448df3dcc5ae7abe300ad50a59aead245234a88032b79fe1a9a3a51'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 revanced-patches-${pkgver}.jar "${pkgdir}/usr/share/revanced/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
