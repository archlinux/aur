pkgname=bun-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('197c2224945a9edbc41302c7f2562ed9eed107d643d9389b0b4a75d20bbb2455b205a2ba3d6dbe31d264b2c7abc3e7a5d54d27abd2cf87334c572e15a09ac77f')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
