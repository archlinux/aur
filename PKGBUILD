pkgname=enumctl-bin
pkgver=2026.08.3
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('7caa767885cf506be219dfaa5cfbc0434ca722008a34c4f884da4dc9474d73a3')
sha256sums_aarch64=('9c051f7615319c5520fd9bb5d8621995e2952014019a2c0c7b46695809b0572c')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
