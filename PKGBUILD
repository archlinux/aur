# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=philosopher-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="Proteomics data processing and FDR filtering toolkit"
arch=('x86_64')
url="https://github.com/Nesvilab/philosopher"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/philosopher_v${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('cf15a2d6321ecb530170b2410f5873f89e283b52d5f1ab0f27eebc124f4f4a1a')

package() {
  install -Dm755 "philosopher" "${pkgdir}/usr/bin/philosopher"
  install -Dm644 "License" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
