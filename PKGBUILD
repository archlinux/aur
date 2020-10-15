#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.1.0
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
sha256sums_i686=("5b10628132dd4b10deaf64355863938263a04a3dda3efe80feb97306fa0c1f07")
sha256sums_x86_64=("7c51c1296601ef94a5df9471c29383fbf76ac20d16deee5c0489a2af386fe008")
sha256sums_armv5h=("f2e667368ae6f343d76008913df7dcdb645528eb3f51842d1a5c63d65ce5b029")
sha256sums_armv6h=("24c2a96f6043b003a81cf2dd5b01b5805afc21c1c8f4d645b14b0ff6b06f9e4e")
sha256sums_armv7h=("8e121e39d55183b81368fc96991295c90cc38229ceb8dc2db8f7ff1840eddfd8")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/cheat"
}
