#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.2.1
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
sha256sums_i686=("7fc9e7bf62fa55b35c3e81596a827fde50f4416521a0a758f7c087af6860fd5a")
sha256sums_x86_64=("4965c41eee4e9022b543157317bdb41913782e8bc014ccac7b2c1e5f87450d98")
sha256sums_armv5h=("aacb1b01df42337cd631661ffba13d6f448ce43f1c378b21637d8803e9b24734")
sha256sums_armv6h=("d8604fd172b3fb77c606ecd8a0b5c89918fe832e6fdad3c0ca2ae6b69fdb57f0")
sha256sums_armv7h=("b2c9819c7dcee251bdc30f1bc7a27354c1badbd4e14744d358ee8a3026a0f3c8")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/cheat"
}
