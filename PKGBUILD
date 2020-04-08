# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=bitwarden-cli-bin
_pkgname=bitwarden-cli
pkgver=1.9.1
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

sha512sums=(
  66390bff163bd070fb5e144f96f3e180180abbd6affd54b925d74c79cd2f9a6eaa9e197ebda735631811b2b3965596d82bb421d54a794df1ff9ab18f2af19cf7
)

provides=('bitwarden-cli')
conflicts=('bitwarden-cli')

package() {
  install -Dm755 bw "$pkgdir/usr/bin/bw"
}

# vim:set ts=2 sw=2 et:
