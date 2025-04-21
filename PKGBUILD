# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=hasura-cli-bin
pkgver=2.47.0
pkgrel=1
pkgdesc="Hasura CLI util binary"
arch=('x86_64')
url="https://hasura.io/docs/latest/hasura-cli/overview/"
license=('Apache-2.0')
depends=()
source=(hasura-cli-${pkgver}::https://github.com/hasura/graphql-engine/releases/download/v${pkgver}/cli-hasura-linux-amd64)
sha256sums=('e1beb64a22ee90af6d1375bfd4d20a1f867706ab2c2090c7ecbda284bff77db6')
options=(!strip)

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/bin"
  install -m 755 ./hasura-cli-${pkgver} "${pkgdir}/usr/bin/hasura"
}

# vim:set ts=2 sw=2 et:
