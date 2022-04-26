# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=kafka-gitops
pkgname=kafka-gitops
pkgver=$PKGVER
pkgrel=1
pkgdesc="Manage Apache Kafka topics and generate ACLs through a desired state file."
arch=('x86_64')
url="https://github.com/devshawn/kafka-gitops"
depends=('java-runtime')
license=('Apache-2')
source=("https://github.com/devshawn/${_name}/releases/download/${pkgver}/${_name}.zip")
sha256sums=('6794d29feca2512a6436393d62672da010839440e6a34be5ac1697e95e422c1a')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
