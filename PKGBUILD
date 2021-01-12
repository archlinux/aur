# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=bitwarden-cli-bin
_pkgname=bitwarden-cli
pkgver=1.13.3
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

provides=('bitwarden-cli')
conflicts=('bitwarden-cli')

package() {
  install -Dm755 bw "$pkgdir/usr/bin/bw"
}

sha512sums=('0c91958ddf0ffa0676182b6e7183822454314b84743103637a69b37a17b1b67430798500305c687e0f3df6647bed241a0e98baf5f1c47de08bce36c3d903d37e')
# vim:set ts=2 sw=2 et:
