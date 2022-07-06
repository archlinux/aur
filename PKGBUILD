#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.2.5
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
source_aarch64=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm64.gz")
url="https://github.com/cheat/cheat"
license=("MIT")
sha256sums_i686=("03db4868df26241f8bae330f4f518c4bb582da6394e5a1fd4828888f0ca2e8a0")
sha256sums_x86_64=("e8f97f55afe7206dc6b16c7b3fee06427cd5608a262ea93d0e377d36fd91b041")
sha256sums_armv5h=("7dcf77b0505eb32d7c6aa5994ca1df52ed224d44e4f801134c53015ded8d6271")
sha256sums_armv6h=("79fa27d8e9957c13e54940dfaaa3285ab65ad8237a4b37b5a28421492db2f4a5")
sha256sums_armv7h=("05828d515bd1ff18066d962db2f6df88e817a073d7d205902cd18e67bcd32e74")
sha256sums_aarch64=("15fe88a6086dc4164a1a5f03646167e35783ae3da9249b92a5992f0d7fd6daf3")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/cheat"
}
