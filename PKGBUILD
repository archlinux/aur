# Maintainer: Douglas de Moura <douglas@demoura.dev>

pkgname=chroncal-bin
_pkgname=chroncal
pkgver=0.2.3
pkgrel=1
pkgdesc='Terminal-first calendar, todo, and journal manager'
arch=('x86_64' 'aarch64')
url='https://github.com/DouglasdeMoura/chroncal'
license=('MIT')
provides=('chroncal')
conflicts=('chroncal')
source=("LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('2e78ee45f8646d82acb7951979d4dbe02f90221d6a8e13f74604aef40932a366')
sha256sums_x86_64=('93e446a05fce70ced1a9ff72536fc9534300574847f1a4ec91d2498c0142c72e')
sha256sums_aarch64=('c701af33ba1017e2a5b24ecc8c300e715c6b9659d2c8a4f8998f46d0350f5c33')

package() {
  install -Dm755 chroncal "${pkgdir}/usr/bin/chroncal"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
