# Maintainer: Adam Kovari <adam@kovari.eu>
pkgname=winetop-bin
pkgver=0.1.3
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
sha256sums_x86_64=('5589872edd8938e6e6b3368d613ae24335820c28742fb61443c8cdcbd95821bb')
sha256sums_aarch64=('728c50ce8d6a537c6475b2ed9b8bb983259e9c8a578e1a14522cb82a25f9a9bc')

package() {
  install -Dm755 winetop "$pkgdir/usr/bin/winetop"
}
