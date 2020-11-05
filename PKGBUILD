# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=bitwarden-cli-bin
_pkgname=bitwarden-cli
pkgver=1.12.1
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

sha512sums=('27d032af120c272497c14abed07c7d47a99337cd72cb1f6f02bf457438c445ba426447379c45fb92a1d46e8e56be6b63a1325c6a5f062f681ba0463406fdd35b')

provides=('bitwarden-cli')
conflicts=('bitwarden-cli')

package() {
  install -Dm755 bw "$pkgdir/usr/bin/bw"
}

# vim:set ts=2 sw=2 et:
