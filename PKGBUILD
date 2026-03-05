# Maintainer: Pierre Carru <pierre@carru.fr>

pkgname=googleworkspace-cli-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='One CLI for all of Google Workspace'
url='https://github.com/googleworkspace/cli'
license=('Apache-2.0')
makedepends=()
depends=()
arch=('x86_64' 'aarch64')
source=("https://github.com/googleworkspace/cli/releases/download/v${pkgver}/gws-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=('9965c70a289d566c71077020f69be9f630a7501ac07901810d0cfd4a9e285dc7')
options=(!strip !debug)

package() {
  install -Dm755 */gws "$pkgdir/usr/bin/gws"
}
