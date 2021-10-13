# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.3.0
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
sha512sums_x86_64=('c305a2a0729269886f8866feebbdd476ce5777476c101fd31a11dbe433f6c31d5e542deec9f085d952661d6644307fc6e7e38501e8fa62269caceb45ea7e4288')
sha512sums_pentium4=('c305a2a0729269886f8866feebbdd476ce5777476c101fd31a11dbe433f6c31d5e542deec9f085d952661d6644307fc6e7e38501e8fa62269caceb45ea7e4288')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/akamai"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
