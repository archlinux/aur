# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Manage and configure Akamai from the Command Line'
arch=('x86_64' 'pentium4')
url="https://developer.akamai.com/cli"
license=('Apache')
provides=('akamai' 'akamai-cli')

source=(
  "https://raw.githubusercontent.com/akamai/cli/$pkgver/LICENSE"
)
source_x86_64=(
  "$pkgname-$pkgver-$CARCH::https://github.com/akamai/cli/releases/download/$pkgver/akamai-$pkgver-linuxamd64"
)
source_pentium4=(
  "$pkgname-$pkgver-$CARCH::https://github.com/akamai/cli/releases/download/$pkgver/akamai-$pkgver-linux386"
)

sha512sums=('389080b6132d3eaae780648d6998390d8cc71908561bce09578e27c542aa1a9f3122e01f640c5b01bee73004c23aa4e9f2066fe5ee0ca2072c2420578b28d71f')
sha512sums_x86_64=('f10f396f37b852df379c96b4ac3df8c23709ca05b85088563a8be82e512f4cc71e706ab078a7b86ffa60d25b181bd28aadf6515b5f27241839b06d90bfa4d25a')
sha512sums_pentium4=('f10f396f37b852df379c96b4ac3df8c23709ca05b85088563a8be82e512f4cc71e706ab078a7b86ffa60d25b181bd28aadf6515b5f27241839b06d90bfa4d25a')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/akamai"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
