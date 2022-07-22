# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="pluralith-cli-bin"
pkgver=0.1.11
pkgrel=1
pkgdesc="Pluralith CLI for integration with Terraform and other useful little tools"
url="https://github.com/Pluralith/pluralith-cli"
arch=('x86_64')
license=('Apache-2.0')
provides=('pluralith')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/pluralith_cli_linux_amd64_v${pkgver}")
sha256sums_x86_64=('f89f0eab65ea3fccb55d23ca46bc43899f76a1da65788e2b07fcab3cf02986c2')

package() {
  install -Dm755 pluralith-cli-bin "$pkgdir/usr/bin/pluralith"
}
