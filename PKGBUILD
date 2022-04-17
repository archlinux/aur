# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=terraboard
pkgname=terraboard
pkgver=$PKGVER
pkgrel=1
pkgdesc="A web dashboard to inspect Terraform States."
arch=('x86_64')
url="https://github.com/camptocamp/terraboard/"
license=('Apache-2')
source=("https://github.com/camptocamp/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.zip")
sha256sums=('d43f3bff8d95138fed816f4dcd025df6dbcfcfdc73579fe96ceaeaae85caafd4')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_v${pkgver} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_name}/CHANGELOG.md
}
