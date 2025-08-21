# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=2.0.2
pkgrel=1
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
b2sums_x86_64=('1b5776a996573afa8e8f65f328c2bb6eeb76f566c9d9f38cd180eef4365f646f84468bca7d963135991190455d4287a9f6cb03816f55f9a0b6dc1ec07e30dfb9')
b2sums_pentium4=('1b5776a996573afa8e8f65f328c2bb6eeb76f566c9d9f38cd180eef4365f646f84468bca7d963135991190455d4287a9f6cb03816f55f9a0b6dc1ec07e30dfb9')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/akamai"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
