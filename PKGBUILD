# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terraboard
pkgver=2.1.1
pkgrel=3
pkgdesc="A web dashboard to inspect Terraform States."
arch=('x86_64')
url="https://github.com/camptocamp/terraboard/"
license=('Apache-2')
source=("${pkgname}-${pkgver}_linux_amd64.zip::https://github.com/camptocamp/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.zip")
sha256sums=('d43f3bff8d95138fed816f4dcd025df6dbcfcfdc73579fe96ceaeaae85caafd4')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}_v${pkgver} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
