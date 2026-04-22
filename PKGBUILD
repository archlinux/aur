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
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' '939ed4572f6d4ec98e3af56586f93f7312e700942fc12d4dd42094e0606ddf8c')
sha256sums_x86_64=('401cea18ffea92b195e5c1ff194ad6d2a485eea552046e927fb2d59a9db3f5b5')
sha256sums_aarch64=('00d047b62b25c2b2ea279287db7dcdd1026e8583494a0c1a7af9636fd6bfbf18')

package() {
  install -Dm755 mcl "$pkgdir/usr/bin/mcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
