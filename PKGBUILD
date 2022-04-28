# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=kafka-gitops
pkgname=kafka-gitops
pkgver=0.2.15
pkgrel=1
pkgdesc="Manage Apache Kafka topics and generate ACLs through a desired state file."
arch=('x86_64')
url="https://github.com/devshawn/kafka-gitops"
depends=('java-runtime')
license=('Apache-2')
source=("https://github.com/devshawn/${_name}/releases/download/${pkgver}/${_name}.zip")
sha256sums=('182e35a3693a6864e58d47ef419141486adb19acb9385120257a03088789abe8')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
