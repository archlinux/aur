# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=bitwarden-cli-bin
_pkgname=bitwarden-cli
pkgver=1.7.4
pkgrel=1
pkgdesc='Natively packaged versions of the bitwarden cli'
arch=(x86_64)
url='https://github.com/bitwarden/cli'
license=('GPL3')
depends=('gcc-libs')
makedepends=()

source=(
  "https://github.com/bitwarden/cli/releases/download/v$pkgver/bw-linux-$pkgver.zip"
)

sha512sums=(
  d6fb0ff065fd9a534329214fdaa50c8734ee7c9099f32080dee8536432d96055c427e457583af548cba4a7caceb700185522462964aad01c989a265a37228cb3
)

provides=('bitwarden-cli')
conflicts=('bitwarden-cli')

package() {
  install -Dm755 bw "$pkgdir/usr/bin/bw"
}

# vim:set ts=2 sw=2 et:
