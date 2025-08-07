# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terraboard

pkgname=terraboard-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="A web dashboard to inspect Terraform States."
arch=('x86_64')
url="https://github.com/camptocamp/terraboard/"
conflicts=('terraboard')
provides=('terraboard')
license=('Apache-2')
source=("${pkgname}-${pkgver}_linux_amd64.zip::https://github.com/camptocamp/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_amd64.zip")
sha256sums=('95a81427355d77b7d9a2cf977a5215abfd642029fbeb67694a80877e884e4e17')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit}_v${pkgver} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
