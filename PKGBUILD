# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=diun

pkgname=diun-bin
pkgver=4.24.0
pkgrel=2
pkgdesc="Receive notifications when an image is updated on a Docker registry."
arch=('x86_64')
url="https://github.com/crazy-max/diun"
conflicts=('diun')
provides=('diun')
license=('MIT')
source=("${_pkggit}-${pkgver}_linux_amd64.tar.gz::https://github.com/crazy-max/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3de1b4a0314a82dcaabe0bc82fbd28aab3eaecb6fb48ee768979c61bd654defa')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
