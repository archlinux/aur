# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="pluralith-cli-bin"
pkgver=0.1.8
pkgrel=1
pkgdesc="Pluralith CLI for integration with Terraform and other useful little tools"
url="https://github.com/Pluralith/pluralith-cli"
arch=('x86_64')
license=('Apache-2.0')
provides=('pluralith')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/pluralith_cli_linux_amd64_v${pkgver}")
sha256sums_x86_64=('eb5757e1a6e246a666d4d7e16da14abecbc269a3f883c2dc762ac59e11a3bf05')

package() {
  install -Dm755 pluralith-cli-bin "$pkgdir/usr/bin/pluralith"
}
