# Maintainer: Liin L <Liin@Xemmon.Space>

pkgname='otf-urbanist'
pkgver=1.321
pkgrel=1
pkgdesc="Urbanist is a low-contrast, geometric sans-serif inspired by Modernist design and typography."
url="https://github.com/coreyhu/Urbanist"
arch=(any)
license=(custom)
source=("https://github.com/coreyhu/Urbanist/releases/download/v${pkgver}/Urbanist-fonts.zip"
  "OFL.txt")

sha256sums=('43b9c601884e3d348016444d34c5d55ac3381d18fdbe9644432be50305fa54c3'
            '93b568382826c6f92eda0dc4807d0106b05141fb8348cd63ac996077e8cc47fa')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname}"
  install -m644 "${srcdir}/Urbanist-fonts/fonts/otf/"*.otf "${pkgdir}/usr/share/fonts/${pkgname}"
  install -Dm644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

