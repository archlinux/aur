# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terramate
pkgver=0.1.0
pkgrel=1
pkgdesc="Terramate is a tool for managing multiple Terraform stacks that comes with support for change detection and code generation."
arch=('x86_64')
url="https://github.com/mineiros-io/terramate"
license=('Apache-2')
source=("https://github.com/mineiros-io/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('e97f569defb91fc9c5461705db1be2912a01e1fb065221403ea95e0a6bb24241')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
