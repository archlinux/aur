# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>

pkgname=terragrunt-bin
_pkgname=terragrunt
pkgver=0.13.3
pkgrel=1
pkgdesc="A thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules"
url="https://github.com/gruntwork-io/terragrunt"
depends=('terraform')
conflicts=('terragrunt')
provides=('terragrunt')
license=('MIT')
arch=('x86_64')
source=(
  "https://github.com/gruntwork-io/terragrunt/releases/download/v0.13.3/terragrunt_linux_amd64"
  "https://raw.githubusercontent.com/gruntwork-io/terragrunt/v0.13.3/LICENSE.txt"
)
sha256sums=(
  '77759a2b3948f2786df095f3c10f329cc8ceea9dd7d1ad13b26c05c8f5f43243'
  'a462de65463e142a430b65770650f5f028d28b60e13a830ac8092506ff2c7146'
)

package() {
  install -D -m 755 "${srcdir}/terragrunt_linux_amd64" "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m 644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
