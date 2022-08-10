# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=diun

pkgname=diun-bin
pkgver=4.22.0
pkgrel=1
pkgdesc="Receive notifications when an image is updated on a Docker registry."
arch=('x86_64')
url="https://github.com/crazy-max/diun"
conflicts=('diun')
provides=('diun')
license=('MIT')
source=("${_pkggit}-${pkgver}_linux_amd64.tar.gz::https://github.com/crazy-max/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b519c498b458a732d936f85f2124e31f81fdf4caf0e665115c6539aab4a26f25')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
