# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=bitwarden-cli-bin
_pkgname=bitwarden-cli
pkgver=1.12.0
pkgrel=1
pkgdesc='Natively packaged versions of the bitwarden cli'
arch=(x86_64)
url='https://github.com/bitwarden/cli'
license=('GPL3')
depends=('gcc-libs')
makedepends=()
options=(!strip)

source=(
  "https://github.com/bitwarden/cli/releases/download/v$pkgver/bw-linux-$pkgver.zip"
)

sha512sums=('da3612b05e91b3437c3992f418ae0568983577d62364c9666cb1b9e319197fe1bbbde7957f0be8093e45d51f0d2df0f6b419bee0f706be1dceebf018dfe56ee8')

provides=('bitwarden-cli')
conflicts=('bitwarden-cli')

package() {
  install -Dm755 bw "$pkgdir/usr/bin/bw"
}

# vim:set ts=2 sw=2 et:
