#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.0.3
pkgrel=2
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
sha256sums_i686=("48fdc4eff4d89a4e50cebb7e38af487558b43f1b6016ea9e993e80a70e564181")
sha256sums_x86_64=("1a167a32cbbac8bab2da9a87d72284ee3b6382b84edf6db3e00d49ce6c762ed0")
sha256sums_armv5h=("64d0b25055fe0f0ae73ecaa7275316e6496eaddb42b6a08b2288690c68905ced")
sha256sums_armv6h=("109bf8a576cc42b73ee70430cd943c9fa617e06326b5d2f1380704d704be985b")
sha256sums_armv7h=("beb53680a400c55479a72222c91b5c0cf55228528d558744a778e36de449c9a6")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/cheat"
}
