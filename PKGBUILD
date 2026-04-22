# Maintainer: objz <me@objz.dev>
pkgname=mcl-launcher-bin
pkgver=0.2.0
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
            '939ed4572f6d4ec98e3af56586f93f7312e700942fc12d4dd42094e0606ddf8c')
sha256sums_x86_64=('29bd21b78f44d6d963d25cb16b63350be7d4e97df526f9cb205b3ff44ae21a5b')
sha256sums_aarch64=('30a0291f84743efccc9e1f8dcf1ce9a439b9af04784f604eea0121ea1d89290a')

package() {
  install -Dm755 mcl "$pkgdir/usr/bin/mcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
