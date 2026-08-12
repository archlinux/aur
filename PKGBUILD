# Maintainer: Adam Kovari <adam@kovari.eu>
pkgname=winetop-bin
pkgver=0.2.1
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
sha256sums_x86_64=('31af0880ef68e0702bb4f6fb6275665f618627af2599395f422dcbab8b0b8831')
sha256sums_aarch64=('6287eda36703a8e6c9ee8c836cc40756bdf581d7634eebccd2186e440da61dcd')

package() {
  install -Dm755 winetop "$pkgdir/usr/bin/winetop"
}
