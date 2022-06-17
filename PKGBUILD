# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terraboard
pkgver=2.2.0
pkgrel=4
pkgdesc="A web dashboard to inspect Terraform States."
arch=('x86_64')
url="https://github.com/camptocamp/terraboard/"
license=('Apache-2')
source=("${pkgname}-${pkgver}_linux_amd64.zip::https://github.com/camptocamp/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.zip")
sha256sums=('4c490da80d6934a3830274ca01537981489c88fb95b26df52a66f79d2dbf3f58')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}_v${pkgver} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
