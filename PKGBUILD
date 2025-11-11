# Maintainer: Norbert <sandwich@archworks.co>

pkgname=ft-bin
pkgver=3.0.0
pkgrel=0
pkgdesc="Tunnel TCP connections through a file"
arch=('x86_64' 'aarch64')
url="https://github.com/fiddyschmitt/File-Tunnel"
license=('MIT')
source_x86_64=("ft::https://github.com/fiddyschmitt/File-Tunnel/releases/download/v${pkgver}/ft-linux-x64")
source_aarch64=("ft::https://github.com/fiddyschmitt/File-Tunnel/releases/download/v${pkgver}/ft-linux-arm64")
source=("LICENSE.md::https://raw.githubusercontent.com/fiddyschmitt/File-Tunnel/v${pkgver}/LICENSE.md")

sha256sums=('d4c8e99eb5b01980f68353fbcdb09a11f45e2993cfc106c8bacce5c244b329c7')
sha256sums_x86_64=('a3d4e7fda2f567ab80ff0167728f24af4cec46c1ca097785273b1c68e16ffea1')
sha256sums_aarch64=('a3d4e7fda2f567ab80ff0167728f24af4cec46c1ca097785273b1c68e16ffea1')

package() {
  install -Dm755 "$srcdir/ft" "$pkgdir/usr/bin/ft"
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
