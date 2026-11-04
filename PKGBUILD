# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=hasura-cli-bin
pkgver=2.51.4
pkgrel=1
pkgdesc="Hasura CLI util binary"
arch=('x86_64')
url="https://hasura.io/docs/latest/hasura-cli/overview/"
license=('Apache-2.0')
depends=()
source=(hasura-cli-${pkgver}::https://github.com/hasura/graphql-engine/releases/download/v${pkgver}/cli-hasura-linux-amd64)
sha256sums=('76ef9a33548a36449b833652c2e2dd0d0a60b94fd4efc10e96a0ac7b25262885')
options=(!strip)

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/bin"
  install -m 755 ./hasura-cli-${pkgver} "${pkgdir}/usr/bin/hasura"
}

# vim:set ts=2 sw=2 et:
