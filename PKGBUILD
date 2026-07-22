# Maintainer: Adam Kovari <adam@kovari.eu>
pkgname=winetop-bin
pkgver=0.1.6
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
sha256sums_x86_64=('67eb3eae748b3c819e15a4a6cd640148233e0017616de06ed3cc1c98dabdd6d3')
sha256sums_aarch64=('9149e7012f17131ed3b84d97153a85c516eb53eca706e744d5958f708b3a0e66')

package() {
  install -Dm755 winetop "$pkgdir/usr/bin/winetop"
}
