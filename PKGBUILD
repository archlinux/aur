# Maintainer: Adam Kovari <adam@kovari.eu>
pkgname=winetop-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="htop for Wine prefixes — monitor and kill Wine/Proton sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/akovari/winetop"
license=('MIT')
provides=('winetop')
conflicts=('winetop')
options=('!strip')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.xz::https://github.com/akovari/winetop/releases/download/v$pkgver/winetop-v$pkgver-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.xz::https://github.com/akovari/winetop/releases/download/v$pkgver/winetop-v$pkgver-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('254ec262e94e9456768a7f098ecd1a3168136e3c9dcb05b63b7384c20a279154')
sha256sums_aarch64=('54e064f14a7d6ca0583e669f7a70734ffbb6421713ba5f7ab41352d486489a17')

package() {
  install -Dm755 winetop "$pkgdir/usr/bin/winetop"
}
