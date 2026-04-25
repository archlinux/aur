# Maintainer: objz <me@objz.dev>
pkgname=mcl-launcher-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/mcl"
license=('GPL-3.0-only')
depends=()
provides=('mcl-launcher')
conflicts=('mcl-launcher' 'mcl-launcher-git')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE" "README-${pkgver}::${url}/raw/v${pkgver}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/mcl-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/mcl-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '61f2cc61baaeb1b5f1d545d0b62c37a52e5240382d7a1576f532fb1d0eda96a8')
sha256sums_x86_64=('67ff374867c10ca8ac9d51bcb5aa5c28c8c142f36ef011c9af144b30b0feb9b4')
sha256sums_aarch64=('39618ec44c3725f1dc648c8e17c05a21c94e05421fdf4f2d4503c724b83b9591')

package() {
  install -Dm755 mcl "$pkgdir/usr/bin/mcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
