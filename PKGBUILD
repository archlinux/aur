# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Terramate is a tool for managing multiple Terraform stacks that comes with support for change detection and code generation."
arch=('x86_64')
url="https://github.com/terramate-io/terramate"
conflicts=('terramate')
provides=('terramate')
license=('MPL-2')
source=("https://github.com/terramate-io/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('95316fc5602df529454436dabfe578d5d53b8fc64069c009bb27700898d21331')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
