pkgname=enumctl-bin
pkgver=2026.09.9
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('Apache-2.0')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('77596fd4ca723676b17e59cf10de96d4d0ac92f1aeadfbbab02e9d4ca5415735')
sha256sums_aarch64=('d18882ad2367ca01a22ad147ec2a6b61dc344d29b88f06c12982fff3b3b23f2b')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
