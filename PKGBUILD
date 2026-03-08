# Maintainer: Murtaza Patel <murtazapatel89100@gmail.com>

pkgname=filecraft-cli-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="FileCraft CLI organizer (prebuilt binary)"
arch=('x86_64')
url="https://github.com/murtazapatel89100/Filecraft"
license=('MIT')

provides=('filecraft-cli')
conflicts=('filecraft-cli')

options=('!strip')

source=("Filecraft-v$pkgver-linux-amd64::https://github.com/murtazapatel89100/Filecraft/releases/download/v$pkgver/Filecraft-v$pkgver-linux-amd64")

sha256sums=('64649a27d216021f4e9b8c5591bc09c9d9260ad1af3da9d92300722ffeba5cc6')

package() {
  install -Dm755 "$srcdir/Filecraft-v$pkgver-linux-amd64" "$pkgdir/usr/bin/filecraft"
}
