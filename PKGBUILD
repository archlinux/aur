# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Manage and configure Akamai from the Command Line'
arch=('x86_64')
url="https://developer.akamai.com/cli"
license=('Apache')
provides=('akamai' 'akamai-cli')
source=(
  "$pkgname-$pkgver::https://github.com/akamai/cli/releases/download/$pkgver/akamai-$pkgver-linuxamd64"
  "https://raw.githubusercontent.com/akamai/cli/$pkgver/LICENSE"
)
sha512sums=(
  # For the binary file
  '5b30164bc85440c081dad123eef82075aa2d8f218cc595b6b08d71c0afab76ff406bb52e6afbea5ed358e721452b6b8df1b1c04f70ffd94efc494958380c2953'
  # For the LICENSE file
  '389080b6132d3eaae780648d6998390d8cc71908561bce09578e27c542aa1a9f3122e01f640c5b01bee73004c23aa4e9f2066fe5ee0ca2072c2420578b28d71f'
)

package() {
  install -Dm755 "akamai-bin-$pkgver" "$pkgdir/usr/bin/akamai"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
