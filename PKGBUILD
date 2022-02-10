# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="pluralith-cli-bin"
pkgver=0.1.2
pkgrel=1
pkgdesc="Pluralith CLI for integration with Terraform and other useful little tools"
url="https://github.com/Pluralith/pluralith-cli"
arch=('x86_64')
license=('Apache-2.0')
provides=('pluralith')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/pluralith_cli_linux_amd64_${pkgver}")
sha256sums_x86_64=('a0d4f46bf37ed08008b33f4ddee4e7f954bccb6edf0f33f71e2ea0ea927c4dcc')

package() {
  install -Dm755 pluralith-cli-bin "$pkgdir/usr/bin/pluralith"
}
