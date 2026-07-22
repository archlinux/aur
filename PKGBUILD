# Maintainer: Adam Kovari <adam@kovari.eu>
pkgname=winetop-bin
pkgver=0.1.4
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
sha256sums_x86_64=('cf04ad82853addf4e019c19edfb2795058dcc46add8553955ff534a7a434f9cd')
sha256sums_aarch64=('f77c374fb0b4b174ac65c4c3b300366b06cde489d458e95d49fa99a360d3e3b2')

package() {
  install -Dm755 winetop "$pkgdir/usr/bin/winetop"
}
