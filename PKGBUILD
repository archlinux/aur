# Maintainer: Sandwich <sandwich@archworks.co>

pkgname=ft-bin
pkgver=3.5.3
pkgrel=1
pkgdesc="Tunnel TCP connections through a file"
arch=('x86_64' 'aarch64')
url="https://github.com/fiddyschmitt/File-Tunnel"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('ft')
conflicts=('ft')
options=('!strip')
source=("LICENSE.md::https://raw.githubusercontent.com/fiddyschmitt/File-Tunnel/v${pkgver}/LICENSE.md")
source_x86_64=("ft::https://github.com/fiddyschmitt/File-Tunnel/releases/download/v${pkgver}/ft-linux-x64")
source_aarch64=("ft::https://github.com/fiddyschmitt/File-Tunnel/releases/download/v${pkgver}/ft-linux-arm64")
sha256sums=('d4c8e99eb5b01980f68353fbcdb09a11f45e2993cfc106c8bacce5c244b329c7')
sha256sums_x86_64=('9d2690cc0b37d07aa015296946042e93a26b51709e1302489464eed8e5e5a128')
sha256sums_aarch64=('078b4e8721ba936825fc4776b6dee01ee5e02c1b7c2c586e7f039e84258fe525')

package() {
  install -Dm755 "$srcdir/ft" "$pkgdir/usr/bin/ft"
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
