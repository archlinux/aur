# Maintainer: 46620 <46620osu@gmail.com>
pkgname='revanced-patches-bin'
pkgver=5.23.0
pkgrel=1
pkgdesc='Patches for ReVanced'
arch=('any')
url="https://github.com/revanced/revanced-patches"
license=('GPL3')
depends=('java-environment>=17')
provides=('revanced-patches')
conflicts=('revanced-patches')
source=("${url}/releases/download/v${pkgver}/patches-${pkgver}.rvp"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('75733f55eaa3c14f2e627cad81bd48faf29cf6fc7f660e931a3bb12a8e05cb5f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 644 patches-${pkgver}.rvp "${pkgdir}/usr/share/revanced/${pkgname}.rvp"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
