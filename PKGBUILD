# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Terramate is a tool for managing multiple Terraform stacks that comes with support for change detection and code generation."
arch=('x86_64')
url="https://github.com/terramate-io/terramate"
conflicts=('terramate')
provides=('terramate')
license=('MPL-2')
source=("https://github.com/terramate-io/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('702f87f6316b3b12520045010b16d9acab4f0de9e947dfb35efe244613f8a37f')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
