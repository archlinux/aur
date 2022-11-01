# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.1.40
pkgrel=2
pkgdesc="Terramate is a tool for managing multiple Terraform stacks that comes with support for change detection and code generation."
arch=('x86_64')
url="https://github.com/mineiros-io/terramate"
conflicts=('terramate')
provides=('terramate')
license=('Apache-2')
source=("https://github.com/mineiros-io/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('e2bd337eede1118b8cd7d11936ed2f86ad8fd8460c163ea681054b787516ed50')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${_pkggit}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
