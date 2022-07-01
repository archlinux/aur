# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terramate
pkgver=0.1.10
pkgrel=1
pkgdesc="Terramate is a tool for managing multiple Terraform stacks that comes with support for change detection and code generation."
arch=('x86_64')
url="https://github.com/mineiros-io/terramate"
license=('Apache-2')
source=("https://github.com/mineiros-io/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('66e8109a6e596c7f880b3f4a0a4286004fcaafcd9e87db135714c5330cdd177a')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
