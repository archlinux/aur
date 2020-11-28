#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="cheat allows you to create and view interactive cheatsheets on the command-line"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
conflicts=('cheat')
provides=('cheat')
source_i686=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-386.gz")
source_x86_64=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-amd64.gz")
source_armv5h=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm5.gz")
source_armv6h=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm6.gz")
source_armv7h=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm7.gz")
url="https://github.com/cheat/cheat"
license=("MIT")
sha256sums_i686=("3f775672f876bc9dc2e1c70d5bc69fdfac616e3706471f379bb297f099700d89")
sha256sums_x86_64=("25d64ac3565c6976d3bb8508fb2a3434d7f7a696762735d3103e5bf039338338")
sha256sums_armv5h=("088f43faecd74c7b17c26df30a23f058fbef839aca3e345566662203731a98b1")
sha256sums_armv6h=("a0c9be660db4efdb18d504807900359e6796f5171aeb2bf0dc070f309a417fd4")
sha256sums_armv7h=("9b1d5605b90bd4a7b62744ce4203beb1fc2c8e3eb16bbb7dd6417746413281f9")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/cheat"
}
