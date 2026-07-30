pkgname=enumctl-bin
pkgver=2026.07.1
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('70c660b66d853f8b5a97f154b36ce9253cbed9fb2d66624db039be924dd47ce0')
sha256sums_aarch64=('dcb1dea6c406e602e48db3893742ad281d4785b2cb3dda15de9d10261b728782')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
