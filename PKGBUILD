# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=hasura-cli-bin
pkgver=2.45.1
pkgrel=1
pkgdesc="Hasura CLI util binary"
arch=('x86_64')
url="https://hasura.io/docs/latest/hasura-cli/overview/"
license=('Apache-2.0')
depends=()
source=(hasura-cli-${pkgver}::https://github.com/hasura/graphql-engine/releases/download/v${pkgver}/cli-hasura-linux-amd64)
sha256sums=('483b5e7ed52e0e6afb5fbc9e8accad0b62bc45ce4db7f7f44357d91a5a0126b1')
options=(!strip)

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/bin"
  install -m 755 ./hasura-cli-${pkgver} "${pkgdir}/usr/bin/hasura"
}

# vim:set ts=2 sw=2 et:
