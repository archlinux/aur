# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.5.2
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
  "$pkgname-$pkgver-$CARCH::https://github.com/akamai/cli/releases/download/v$pkgver/akamai-v$pkgver-linuxamd64"
)
source_pentium4=(
  "$pkgname-$pkgver-$CARCH::https://github.com/akamai/cli/releases/download/v$pkgver/akamai-v$pkgver-linux386"
)

b2sums=('21231bed1327f35b322032568be6b848d23595a294f5e055bc2506a57c122b3ebf3809ae9574b2f16b8856c744816658a06091f8d8e596a31586b3f632ae5d6b')
b2sums_x86_64=('c655a8f87035e678d66ef9150ac8ad4e59903d74046e8f2827be7b748463f5551ca2292ff9d297224c4b946c6b23c54c5c0471eeb2892efb30efff513d082a1d')
b2sums_pentium4=('c655a8f87035e678d66ef9150ac8ad4e59903d74046e8f2827be7b748463f5551ca2292ff9d297224c4b946c6b23c54c5c0471eeb2892efb30efff513d082a1d')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/akamai"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
