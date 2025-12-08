#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=termagotchi-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal-based Tamagotchi simulation written in Go, featuring a beautiful TUI interface."
arch=('x86_64')
conflicts=('termagotchi')
provides=('termagotchi')
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/ezeoleaf/termagotchi/releases/download/v$pkgver/termagotchi-linux-amd64")
url="https://github.com/ezeoleaf/termagotchi"
license=("MIT")
sha256sums_x86_64=('2afc7cdcbee367a589e9e703cc408a2c8cf335d00f3ff216567c658e6b7de65d')

package() {
  # Flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/termagotchi"
}
