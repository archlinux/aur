# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.4
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f450b86f85a1972d6ad90af82311b6ee6e3bee2615ea6968f810b642a55509dc')
sha256sums_aarch64=('2dbff862519c8d6e2cf250aeaedea79cd77e89207415f06af69f7c72cd2976af')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
