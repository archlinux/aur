# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=terraboard
pkgname=terraboard
pkgver=2.1.0
pkgrel=1
pkgdesc="A web dashboard to inspect Terraform States."
arch=('x86_64')
url="https://github.com/camptocamp/terraboard/"
license=('Apache-2')
source=("https://github.com/camptocamp/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.zip")
sha256sums=('2b654f3c6fe3257854b9da5d2b215feb6e2614560154f989c6a6ee7e5158d7c1')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_v${pkgver} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_name}/CHANGELOG.md
}
