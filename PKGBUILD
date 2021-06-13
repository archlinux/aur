#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.2.2
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
sha256sums_i686=("92db71bf50f0316c4e1851f19ea893766abeda5a3529027ac7c7b495af1dae8c")
sha256sums_x86_64=("beeef415707099e98ca42681586744c03972d6e292d3125ab6d258c23eefc4c7")
sha256sums_armv5h=("95535577af6c6542c9317986930fae5bccba43cc27241000d26d20493dae2cf1")
sha256sums_armv6h=("09bc5f37e00c3cf5ecbba3d5e551cf3c206b748f84209b16b0e6481f45752c61")
sha256sums_armv7h=("9f42f887fbc4a62c61339666b93a18883549d717427f9962e3c7d5969e3db2d2")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/cheat"
}
