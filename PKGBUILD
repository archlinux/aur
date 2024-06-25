# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=hasura-cli-bin
pkgver=2.40.2
pkgrel=1
pkgdesc="Hasura CLI util binary"
arch=('x86_64')
url="https://hasura.io/docs/latest/hasura-cli/overview/"
license=('Apache-2.0')
depends=()
source=(hasura-cli-${pkgver}::https://github.com/hasura/graphql-engine/releases/download/v${pkgver}/cli-hasura-linux-amd64)
sha256sums=('7b16e830ef534948c5eb0d8325e13e3d6cb8eda40264123892297edf11d3c9e2')

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/bin"
  install -m 755 ./hasura-cli-${pkgver} "${pkgdir}/usr/bin/hasura"
}

# vim:set ts=2 sw=2 et:
