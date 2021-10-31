# Maintainer: trickybestia <trickybestia@gmail.com>

pkgname="linux-discord-rich-presence"
pkgver="2.0.1"
pkgrel="1"
pkgdesc="Customizable Discord Rich Presence client for Linux"
arch=("x86_64")
url="https://github.com/trickybestia/linux-discord-rich-presence"
license=("GPL3")
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("2cd4acd380a5bd398106cb3af9e750708ac6456dc7161f661e56fedd9a851d6e")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
  install -Dt "$pkgdir/usr/bin/" "./target/release/linux-discord-rich-presence"
}
