# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=rover

pkgname=rover-bin
pkgver=0.3.3
pkgrel=3
pkgdesc="Interactive Terraform visualization. State and configuration explorer."
arch=('x86_64')
url="https://github.com/im2nguyen/rover"
conflicts=('rover')
provides=('rover')
license=('MIT')
source=("${_pkggit}_${pkgver}_linux_amd64.zip::https://github.com/im2nguyen/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_amd64.zip")
sha256sums=('9af0ccda3b58a87a97cc8a65c6861c209b9118ce048a374ffcf487dc2c27e59b')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit}_v${pkgver} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
