# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=hasura-cli-bin
pkgver=2.42.0
pkgrel=1
pkgdesc="Hasura CLI util binary"
arch=('x86_64')
url="https://hasura.io/docs/latest/hasura-cli/overview/"
license=('Apache-2.0')
depends=()
source=(hasura-cli-${pkgver}::https://github.com/hasura/graphql-engine/releases/download/v${pkgver}/cli-hasura-linux-amd64)
sha256sums=('b641cf8a82dbed4337fd0dcf2f616d5fb3820a13ed81ba6ba6bf268ca1c2cc2b')
options=(!strip)

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/bin"
  install -m 755 ./hasura-cli-${pkgver} "${pkgdir}/usr/bin/hasura"
}

# vim:set ts=2 sw=2 et:
