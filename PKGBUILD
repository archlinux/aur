#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.2.3
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
sha256sums_i686=("faca842f1b5b200558f899c2730cadec00a261cdabbb9fad8638f2487bed8059")
sha256sums_x86_64=("899e7d88d9441b9a32034b0c4b6761157e7977131932a2abc13a382794e7ea6c")
sha256sums_armv5h=("241e04aefc78b66b2b0f3117de5b7c35e3e7190e49aede836806d7eedac62d07")
sha256sums_armv6h=("91c16e3c68bdb97aaec7ec0669ab9d6e7025abf175148a32911d1033d9e38f2d")
sha256sums_armv7h=("4ac2fea19ff1dd063f7fa7e76b5329babeaee8c10756eeeffa8fafecd8c8dabc")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/cheat"
}
