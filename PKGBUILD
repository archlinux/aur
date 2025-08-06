#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=termagotchi-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based Tamagotchi simulation written in Go, featuring a beautiful TUI interface."
arch=('x86_64')
conflicts=('termagotchi')
provides=('termagotchi')
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/ezeoleaf/termagotchi/releases/download/v$pkgver/termagotchi-linux-amd64")
url="https://github.com/ezeoleaf/termagotchi"
license=("MIT")
sha256sums_x86_64=('ba069ecba718ec64bda7d9e5eab78afe0071564a980c37c7efaba6ae7ad42ca6')

package() {
  # Flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/termagotchi"
}
