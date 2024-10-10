# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.6.0
pkgrel=3
pkgdesc='Manage and configure Akamai from the Command Line'
arch=('x86_64' 'pentium4')
url="https://github.com/akamai/cli"
license=('Apache')
provides=('akamai' 'akamai-cli')

source=(
  "https://raw.githubusercontent.com/akamai/cli/v$pkgver/LICENSE"
)
source_x86_64=(
  "$pkgname-$pkgver-$CARCH::https://github.com/akamai/cli/releases/download/v$pkgver/akamai-v$pkgver-linuxamd64"
)
source_pentium4=(
  "$pkgname-$pkgver-$CARCH::https://github.com/akamai/cli/releases/download/v$pkgver/akamai-v$pkgver-linux386"
)

b2sums=('21231bed1327f35b322032568be6b848d23595a294f5e055bc2506a57c122b3ebf3809ae9574b2f16b8856c744816658a06091f8d8e596a31586b3f632ae5d6b')
b2sums_x86_64=('dd1e3fe898b9aacf8c43ff3c626f3942668f96e6c233f53ece075173ee0cc6672da4e801f666b3ca442a3998bd15bfbfb39cd28e203cc08d546f0b3f87801a19')
b2sums_pentium4=('dd1e3fe898b9aacf8c43ff3c626f3942668f96e6c233f53ece075173ee0cc6672da4e801f666b3ca442a3998bd15bfbfb39cd28e203cc08d546f0b3f87801a19')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/akamai"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
