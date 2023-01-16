# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.2.8
pkgrel=2
pkgdesc="Terramate is a tool for managing multiple Terraform stacks that comes with support for change detection and code generation."
arch=('x86_64')
url="https://github.com/mineiros-io/terramate"
conflicts=('terramate')
provides=('terramate')
license=('Apache-2')
source=("https://github.com/mineiros-io/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('8bd976389ee25de606db2d9ec2d2896e3006646f0ca2091b5b8eda4f0ad81fbb')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${_pkggit}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
