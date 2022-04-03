# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='Manage and configure Akamai from the Command Line'
arch=('x86_64' 'pentium4')
url="https://github.com/akamai/cli"
license=('Apache')
provides=('akamai' 'akamai-cli')

source=(
  "https://raw.githubusercontent.com/akamai/cli/$pkgver/LICENSE"
)
source_x86_64=(
  "$pkgname-$pkgver-$CARCH::https://github.com/akamai/cli/releases/download/v$pkgver/akamai-$pkgver-linuxamd64"
)
source_pentium4=(
  "$pkgname-$pkgver-$CARCH::https://github.com/akamai/cli/releases/download/v$pkgver/akamai-$pkgver-linux386"
)

sha512sums=('389080b6132d3eaae780648d6998390d8cc71908561bce09578e27c542aa1a9f3122e01f640c5b01bee73004c23aa4e9f2066fe5ee0ca2072c2420578b28d71f')
sha512sums_x86_64=('b4429a3d96123885d8bc7de08b5a4ce8ffb68ede7fd376a197c0b4e48ad77ec1800b1e96323d506cd86ffe4920b8695b8da621456e22b7d4cab2cee675a96d24')
sha512sums_pentium4=('b4429a3d96123885d8bc7de08b5a4ce8ffb68ede7fd376a197c0b4e48ad77ec1800b1e96323d506cd86ffe4920b8695b8da621456e22b7d4cab2cee675a96d24')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/akamai"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
